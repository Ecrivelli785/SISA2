class QuejasController < ApplicationController
  def index
    @quejas = Queja.all
    respond_to do |format|
      format.html
      format.json
      format.pdf do
      render template: 'quejas/pdf', pdf: 'Reporte'
      end
    end
  end

  def show
    @queja = Queja.find(params[:id])

    #@certificado = Certificado.new
    #@certificado.update cliente_id: params[:id]
    #@certificado.update estado: false
    
    respond_to do |format|
      format.html
      format.json
      format.pdf do
        render template: 'quejas/pdf', pdf: 'Reporte'
      end
    end
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
