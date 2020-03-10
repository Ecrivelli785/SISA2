class CertificadosController < ApplicationController
  before_action :set_certificado, only: [:show, :edit, :update, :destroy]
  
  # GET /certificados
  # GET /certificados.json
  def index
    @certificados = Certificado.all.order(created_at: :DESC)
    respond_to do |format|
      format.html
      format.json
      format.pdf do
        render template: 'certificados/pdf', pdf: 'Reporte'
      end
    end
  end

  # GET /certificados/1
  # GET /certificados/1.json
  def show
    @certificado = Certificado.find(params[:id])
    respond_to do |format|
      format.html
      format.json
      format.pdf do
        render template: 'certificados/pdf', pdf: 'Reporte'
      end
    end
  end

  # GET /certificados/new
  def new

  end

  # GET /certificados/1/edit
  def edit
    
  end

  # POST /certificados
  # POST /certificados.json
  def create
    @certificado = Certificado.find(params[:id]).last

    @certificado.update(certificado_params)

    @certificado.update estado: true

    respond_to do |format|
      if @certificado.update(certificado_params)
        format.html { redirect_to @certificado, notice: 'El certificado fue creado.' }
        format.json { render :show, status: :ok, location: @certificado }
      else
        format.html { render :edit }
        format.json { render json: @certificado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /certificados/1
  # PATCH/PUT /certificados/1.json
  def update
    respond_to do |format|
      if @certificado.update(certificado_params)
        format.html { redirect_to @certificado, notice: 'El Certificado fue actualizado.' }
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
    @certificado.update estado: false

    respond_to do |format|
      format.html { redirect_to certificados_url, notice: 'El Certificado fue eliminado.' }
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
      params.require(:certificado).permit(:nro_certificado, :fecha_aplicacion, :fecha_vencimiento, :hora_aplicacion, :tratamiento, :vector, :superficie, :droga, :codigo, :turno, :observaciones_certificado, :estado, :cliente_id, cliente_attributes: [:cliente_id, :apellido, :cliente_tipo, :nombre, :domicilio, :telefono, :celular, :barrio, :estado, :rubro, :cuit, :correo])
    end
end
