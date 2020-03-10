class ClientesController < ApplicationController
  before_action :set_cliente, only: [:show, :edit, :update, :destroy]

  # GET /clientes
  # GET /clientes.json
  def index
    @clientes = Cliente.all.order(:apellido)
    respond_to do |format|
      format.html
      format.json
      format.pdf do
      render template: 'clientes/pdf', pdf: 'Reporte'
      end
    end
  end
  # GET /clientes/1
  # GET /clientes/1.json
  def show

    @cliente = Cliente.find(params[:id])

    @certificado = Certificado.new
    @certificado.update cliente_id: params[:id]

    @certificado.update estado: true

    @queja = Queja.new
    @queja.update cliente_id: params[:id]
    @queja.update certificado_id: 43

    @queja.update estado: true

    respond_to do |format|
      format.html
      format.json
      format.pdf do
        render template: 'clientes/pdf', pdf: 'Reporte'
      end
    end
  end
  # GET /clientes/new
  def new
    @cliente = Cliente.new
  end

  # GET /clientes/1/edit
  def edit
  end

  # POST /clientes
  # POST /clientes.json
  def create
    @cliente = Cliente.new(cliente_params)

    @cliente.update estado: true

    respond_to do |format|
      if @cliente.save
        format.html { redirect_to @cliente, notice: 'El cliente fue exitosamente creado.' }
        format.json { render :show, status: :created, location: @cliente }
      else
        format.html { render :new }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clientes/1
  # PATCH/PUT /clientes/1.json
  def update
    respond_to do |format|
      if @cliente.update(cliente_params)
        format.html { redirect_to @cliente, notice: 'EL cliente fue exitosamente actualizado.' }
        format.json { render :show, status: :ok, location: @cliente }
      else
        format.html { render :edit }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes/1
  # DELETE /clientes/1.json
  def destroy
    @cliente.update estado: false
    respond_to do |format|
      format.html { redirect_to clientes_url, notice: 'El cliente fue eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cliente_params
      params.require(:cliente).permit(:apellido, :nombre, :domicilio, :celular, :telefono, :estado, :estado_mkt, :cuit, :correo, :observaciones_cliente, :rubro, :cliente_tipo)
    end
end
