class QuejasController < ApplicationController
  before_action :set_queja, only: [:show, :edit, :update, :destroy]

  # GET /quejas
  # GET /quejas.json
  def index
    @quejas = Queja.all
  end

  # GET /quejas/1
  # GET /quejas/1.json
  def show
    @queja = Queja.find(params[:id])
  end

  # GET /quejas/new
  def new

  end

  # GET /quejas/1/edit
  def edit

  end

  # POST /quejas
  # POST /quejas.json
  def create
    @queja = Queja.find(params[:id]).last

    @queja.update(queja_params)

    @queja.update estado: true

    respond_to do |format|
      if @queja.update(queja_params)
        format.html { redirect_to @queja, notice: 'El reclamo fue creado' }
        format.json { render :show, status: :ok, location: @queja }
      else
        format.html { render :edit }
        format.json { render json: @queja.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quejas/1
  # PATCH/PUT /quejas/1.json
  def update
        respond_to do |format|
      if @queja.update(queja_params)
        format.html { redirect_to @queja, notice: 'EL reclamo fue exitosamente actualizado.' }
        format.json { render :show, status: :ok, location: @queja }
      else
        format.html { render :edit }
        format.json { render json: @queja.errors, status: :unprocessable_entity }
      end
    end

  end

# DELETE /quejas/1
  # DELETE /quejas/1.json
  def destroy
    @queja.destroy
    respond_to do |format|
      format.html { redirect_to quejas_url, notice: 'El reclamo fue eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_queja
      @queja = Queja.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def queja_params
      params.require(:queja).permit(:fecha_queja, :observacion, :cliente_id, :nro_queja, :certificado_id, :estado, cliente_attributes: [:cliente_id, :apellido, :cliente_tipo, :nombre, :domicilio, :telefono, :celular, :barrio, :estado, :rubro, :cuit, :correo], certificado_attributes: [:nro_certificado, :fecha_aplicacion, :fecha_vencimiento, :hora_aplicacion, :tratamiento, :vector, :superficie, :droga, :codigo, :observaciones_certificado, :estado, :cliente_id])
    end
end
