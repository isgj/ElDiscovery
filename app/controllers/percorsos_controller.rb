require 'httparty'
require 'bunny'
class PercorsosController < ApplicationController
  before_action :set_percorso, only: [:show, :edit, :update, :destroy]
  before_filter :require_login, except: [:index, :show]

  # GET /percorsos
  # GET /percorsos.json
  def index
    partenza = params[:partenza]
    destinazione = params[:destinazione]
    data = params[:data]
    @percorsos = Percorso.all
    @percorsos = @percorsos.where("lower(partenza) = ?", partenza.downcase) if ! partenza.nil? && ! partenza.empty?
    @percorsos = @percorsos.where("lower(destinazione) = ?", destinazione.downcase) if !destinazione.nil? && ! destinazione.empty?
    @percorsos = @percorsos.where("lower(data) = ?", data.downcase) if !data.nil? && ! data.empty?
  end

  # GET /percorsos/1
  # GET /percorsos/1.json
  def show
    utente = User.find_by(uid: @percorso.utref)
    @utente = utente.name
    @fotoC = utente.image_url
    @partecipanti = Partecipanti.all
    @partecipanti = @partecipanti.where("percorso = ?", @percorso)
    @partecipanteInfo = []
    @partecipanti.each do |p|
      user = User.find_by(uid: p.utente)
      foto = user.image_url
      name = user.name
      @partecipanteInfo.push([foto, name, user.uid])
    end
    @messages = []
    if current_user
      @isPartecipante = @partecipanti.exists?(utente: current_user.uid)
      @partecipante = @partecipanti.find_by(utente: current_user.uid)
      if @isPartecipante || current_user.uid.to_s == @percorso.utref.to_s
        conn = Bunny.new
        conn.start
        ch  = conn.create_channel
        x   = ch.topic("#{@percorso.id}")
        q   = ch.queue("#{@percorso.id}#{current_user.uid}")
        if @isPartecipante
          q.bind(x, :routing_key => "all")
          q.bind(x, :routing_key => "#{current_user.uid}")
        else
          q.bind(x, :routing_key => "*.#{current_user.uid}")
        end

        begin
          q.subscribe(:block => false) do |delivery_info, properties, body|
            if @isPartecipante
              id = delivery_info.routing_key
              user = User.find_by(uid: @percorso.utref)
              foto = user.image_url
              name = user.name
            else
              id = delivery_info.routing_key.split(".").first
              user = User.find_by(uid: id)
              foto = user.image_url
              name = user.name
            end
            @messages.push([id, foto, name, body])
          end
          ch.close
          conn.close
        rescue Interrupt => _
          ch.close
          conn.close
        end
      end
    end

  end

  # GET /percorsos/new
  def new
    @percorso = Percorso.new
  end

  # GET /percorsos/1/edit
  def edit
  end

  # POST /percorsos
  # POST /percorsos.json
  def create
    @percorso = Percorso.new(percorso_params)
    @percorso.utref = current_user.uid
    a = @percorso.partenza
    b = @percorso.destinazione

    doc = HTTParty.get('https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins='+
    a+',italia&destinations='+b+',italia&key=AIzaSyBvf51KQC6u-v6nVflhxbD0xbC1PSJEdpM')
    d=JSON.parse(doc.body)['rows'][0]['elements'][0]['duration']['value']

    @percorso.durata=d
    respond_to do |format|
      if @percorso.save
        conn = Bunny.new
        conn.start
        ch = conn.create_channel
        x = ch.topic("#{@percorso.id}")
        queue = ch.queue("#{@percorso.id}#{current_user.uid}")
        topic = "*." + current_user.uid
        queue.bind(x, :routing_key => topic)
        ch.close
        conn.close

        format.html { redirect_to @percorso, notice: 'Percorso was successfully created.' }
        format.json { render :show, status: :created, location: @percorso }
      else
        format.html { render :new }
        format.json { render json: @percorso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /percorsos/1
  # PATCH/PUT /percorsos/1.json
  def update
    respond_to do |format|
      if @percorso.update(percorso_params)
        format.html { redirect_to @percorso, notice: 'Percorso was successfully updated.' }
        format.json { render :show, status: :ok, location: @percorso }
      else
        format.html { render :edit }
        format.json { render json: @percorso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /percorsos/1
  # DELETE /percorsos/1.json
  def destroy
    @percorso = Percorso.find(params[:id])
    @percorso.destroy

    redirect_to root_path
  end

  def send_message
    @percorso = Percorso.find(params[:id])
    text = params[:message][:text]
    destinatario = params[:destinatario][:id]
    conn = Bunny.new
    conn.start
    ch = conn.create_channel
    x = ch.topic("#{@percorso.id}")
    x.publish(text, :routing_key => destinatario)
    ch.close
    conn.close
  end

  def aggiorna_photo
    @percorso = Percorso.find(params[:id])
    @percorso.image = params[:patch][:photo]
    @percorso.save
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_percorso
      @percorso = Percorso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def percorso_params
      params.require(:percorso).permit(:data, :ora, :partenza, :destinazione, :durata, :utref)
    end

    def require_login
      unless current_user
        redirect_to '/auth/google/'
      end
    end
end
