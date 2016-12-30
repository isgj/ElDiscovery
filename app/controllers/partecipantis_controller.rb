class PartecipantisController < ApplicationController
  before_action :set_partecipanti, only: [:show, :edit, :update, :destroy]

  # GET /partecipantis
  # GET /partecipantis.json
  def index
    @partecipantis = Partecipanti.all
  end

  # GET /partecipantis/1
  # GET /partecipantis/1.json
  def show
  end

  # GET /partecipantis/new
  def new
    @partecipanti = Partecipanti.new
  end

  # GET /partecipantis/1/edit
  def edit
  end

  # POST /partecipantis
  # POST /partecipantis.json
  def create
    id = current_user.uid
    percorso =  params[:percorso]
    @partecipanti = Partecipanti.new(percorso: percorso, utente:  id)

    respond_to do |format|
      if @partecipanti.save
        format.html { redirect_to percorso_path(percorso), notice: 'Partecipanti was successfully created.' }
        format.json { render :show, status: :created, location: @partecipanti }
      else
        format.html { render :new }
        format.json { render json: @partecipanti.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /partecipantis/1
  # PATCH/PUT /partecipantis/1.json
  def update
    respond_to do |format|
      if @partecipanti.update(partecipanti_params)
        format.html { redirect_to @partecipanti, notice: 'Partecipanti was successfully updated.' }
        format.json { render :show, status: :ok, location: @partecipanti }
      else
        format.html { render :edit }
        format.json { render json: @partecipanti.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /partecipantis/1
  # DELETE /partecipantis/1.json
  def destroy
    @partecipanti.destroy
    respond_to do |format|
      format.html { redirect_to partecipantis_url, notice: 'Partecipanti was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_partecipanti
      @partecipanti = Partecipanti.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def partecipanti_params
      params.require(:partecipanti).permit(:percorso, :utente)
    end
end
