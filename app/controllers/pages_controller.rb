class PagesController < ApplicationController
  def home
    @certificados = Certificado.all
    respond_to do |format|
      format.html
      format.json
      format.pdf do
        render template: 'certificados/pdf', pdf: 'Reporte'
      end
    end
  end

  def calendario

  end

  def search
    if params[:search].blank?
      redirect_to(clientes_path, alert: "Campo vacio!") and return
    else
      @parameter = params[:search].downcase
      @results = Cliente.all.where("lower(nombre) LIKE :search OR lower(apellido) LIKE :search OR lower(domicilio) LIKE :search  OR lower(telefono) LIKE :search OR lower(CUIT) LIKE :search OR lower(correo) LIKE :search OR lower(cliente_tipo) LIKE :search OR (celular) LIKE :search OR (celular) LIKE :search OR (cuit) LIKE :search OR lower(rubro) LIKE :search ", search: "%#{@parameter}%")
    end
  end

  def searchwindow
    if params[:searchwindow].blank?
      redirect_to(certificados_path, alert: "Campo vacio!") and return
    else
      @parameter = params[:search].downcase
      @results = Cliente.all.where("lower(nombre) LIKE :search OR lower(apellido) LIKE :search OR lower(domicilio) LIKE :search OR lower(telefono) LIKE :search OR lower(CUIT) LIKE :search OR lower(correo) LIKE :search OR lower(cliente_tipo) LIKE :search OR (celular) LIKE :search", search: "%#{@parameter}%")
    end
  end

  def searchcertificado
    @certificados = Certificado.joins(:cliente)
    if params[:search].blank?
      redirect_to(certificados_path, alert: "Campo vacio!") and return
    else
    @parameter = params[:search].downcase
    @results = Certificado.joins(:cliente).where("lower(nombre) LIKE :search OR lower(apellido) LIKE :search OR lower(superficie) LIKE :search OR lower(vector) LIKE :search OR lower(tratamiento) LIKE :search OR lower(droga) LIKE :search OR lower(codigo) LIKE :search OR lower(domicilio) LIKE :search OR lower(telefono) LIKE :search OR lower(CUIT) LIKE :search OR lower(correo) LIKE :search OR lower(cliente_tipo) LIKE :search OR (celular) LIKE :search OR lower(rubro) LIKE :search", search: "%#{@parameter}%")
      if @results.blank?
        @results = Certificado.all.where("cast(nro_certificado as varchar) LIKE :search OR cast(fecha_aplicacion as varchar) LIKE :search OR cast(fecha_vencimiento as varchar) LIKE :search", search: "%#{@parameter}%")
      end
    end
  end

  def searchtecnico
    if params[:search].blank?
      redirect_to(tecnicos_path, alert: "Campo vacio!") and return
    else
    @parameter = params[:search].downcase
    @results = Tecnico.all.where("lower(nombre) LIKE :search OR lower(apellido) LIKE :search OR lower(domicilio) LIKE :search OR lower(telefono) LIKE:search",search: "%#{@parameter}%")
      if @results.blank?
        @results = Tecnico.all.where("cast(dni as varchar) LIKE :search", search: "%#{@parameter}%")
      end
    end
  end

  def search_nro_cert
    clean_params = (params[:search]).gsub(/\s+/,"")
    query = "%" + clean_params + "%"
    @nro_certificado = Certificado.where('nro_certificado =?',clean_params).first
    puts @nro_certificado.inspect
    @auto = Certificado.where('nro_certificado LIKE ?', query).limit(15).pluck(:name)
    puts @auto.inspect
  end

def searchqueja
  if params[:search].blank?
      redirect_to(queja_path, alert: "Campo vacio!") and return
    else
    @parameter = params[:search].downcase
    @results = Queja.joins(:cliente).where("lower(nombre) LIKE :search OR lower(apellido) LIKE :search OR lower(observacion) LIKE :search", search: "%#{@parameter}%")
      if @results.blank?
        @results = Queja.joins(:certificado).where("cast(nro_certificado as varchar) LIKE :search", search: "%#{@parameter}%")
      end
    end
  end

  respond_to do |format|
    format.html { redirect_to queja_path }
    format.json { render json: @results}
    format.js
  end
end
