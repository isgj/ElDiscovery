require 'httparty'
class PercorsosController < ApplicationController
  before_action :set_percorso, only: [:show, :edit, :update, :destroy]

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
    @utente = @percorso.utref
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
    a = @percorso.partenza
    b = @percorso.destinazione

    doc = HTTParty.get('https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins='+
    a+',italia&destinations='+b+',italia&key=AIzaSyBvf51KQC6u-v6nVflhxbD0xbC1PSJEdpM')
    d=JSON.parse(doc.body)['rows'][0]['elements'][0]['duration']['value']

    @percorso.durata=d
    respond_to do |format|
      if @percorso.save
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_percorso
      @percorso = Percorso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def percorso_params
      params.require(:percorso).permit(:data, :ora, :partenza, :destinazione, :durata, :utref)
    end
end
