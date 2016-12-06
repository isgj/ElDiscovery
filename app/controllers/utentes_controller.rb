class UtentesController < ApplicationController
  before_action :set_utente, only: [:show, :edit, :update, :destroy]

  # GET /utentes
  # GET /utentes.json
  def index
    @utentes = Utente.all
  end

  # GET /utentes/1
  # GET /utentes/1.json
  def show
  end

  # GET /utentes/new
  def new
    @utente = Utente.new
  end

  # GET /utentes/1/edit
  def edit
  end

  # POST /utentes
  # POST /utentes.json
  def create
    @utente = Utente.new(utente_params)

    respond_to do |format|
      if @utente.save
        format.html { redirect_to @utente, notice: 'Utente was successfully created.' }
        format.json { render :show, status: :created, location: @utente }
      else
        format.html { render :new }
        format.json { render json: @utente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /utentes/1
  # PATCH/PUT /utentes/1.json
  def update
    respond_to do |format|
      if @utente.update(utente_params)
        format.html { redirect_to @utente, notice: 'Utente was successfully updated.' }
        format.json { render :show, status: :ok, location: @utente }
      else
        format.html { render :edit }
        format.json { render json: @utente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /utentes/1
  # DELETE /utentes/1.json
  def destroy
    @utente.destroy
    respond_to do |format|
      format.html { redirect_to utentes_url, notice: 'Utente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_utente
      @utente = Utente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def utente_params
      params.require(:utente).permit(:nome, :email, :età, :sesso, :idg)
    end
end
