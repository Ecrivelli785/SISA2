class CertificadosController < ApplicationController
  before_action :set_certificado, only: [:show, :edit, :update, :destroy]

  # GET /certificados
  # GET /certificados.json
  def index
    @certificados = Certificado.all
  end

  # GET /certificados/1
  # GET /certificados/1.json
  def show
  end

  # GET /certificados/new
  def new
    @certificado = Certificado.new
  end

  # GET /certificados/1/edit
  def edit
  end

  # POST /certificados
  # POST /certificados.json
  def create
    @certificado = Certificado.new(certificado_params)

    respond_to do |format|
      if @certificado.save
        format.html { redirect_to @certificado, notice: 'Certificado was successfully created.' }
        format.json { render :show, status: :created, location: @certificado }
      else
        format.html { render :new }
        format.json { render json: @certificado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /certificados/1
  # PATCH/PUT /certificados/1.json
  def update
    respond_to do |format|
      if @certificado.update(certificado_params)
        format.html { redirect_to @certificado, notice: 'Certificado was successfully updated.' }
        format.json { render :show, status: :ok, location: @certificado }
      else
        format.html { render :edit }
        format.json { render json: @certificado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /certificados/1
  # DELETE /certificados/1.json
  def destroy
    @certificado.destroy
    respond_to do |format|
      format.html { redirect_to certificados_url, notice: 'Certificado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_certificado
      @certificado = Certificado.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def certificado_params
      params.require(:certificado).permit(:nro_certificado, :fecha_aplicacion, :fecha_vencimiento, :hora_aplicacion, :tratamiento, :vector, :superficie, :droga, :codigo, :observaciones_certificado, :estado, :cliente_id)
    end
end
