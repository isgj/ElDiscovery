class PartecipantesController < ApplicationController
  before_action :set_partecipante, only: [:show, :edit, :update, :destroy]

  # GET /partecipantes
  # GET /partecipantes.json
  def index
    @partecipantes = Partecipante.all
  end

  # GET /partecipantes/1
  # GET /partecipantes/1.json
  def show
  end

  # GET /partecipantes/new
  def new
    @partecipante = Partecipante.new
  end

  # GET /partecipantes/1/edit
  def edit
  end

  # POST /partecipantes
  # POST /partecipantes.json
  def create
    @partecipante = Partecipante.new(partecipante_params)

    respond_to do |format|
      if @partecipante.save
        format.html { redirect_to @partecipante, notice: 'Partecipante was successfully created.' }
        format.json { render :show, status: :created, location: @partecipante }
      else
        format.html { render :new }
        format.json { render json: @partecipante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /partecipantes/1
  # PATCH/PUT /partecipantes/1.json
  def update
    respond_to do |format|
      if @partecipante.update(partecipante_params)
        format.html { redirect_to @partecipante, notice: 'Partecipante was successfully updated.' }
        format.json { render :show, status: :ok, location: @partecipante }
      else
        format.html { render :edit }
        format.json { render json: @partecipante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /partecipantes/1
  # DELETE /partecipantes/1.json
  def destroy
    @partecipante.destroy
    respond_to do |format|
      format.html { redirect_to partecipantes_url, notice: 'Partecipante was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_partecipante
      @partecipante = Partecipante.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def partecipante_params
      params.require(:partecipante).permit(:percorso, :utente)
    end
end
