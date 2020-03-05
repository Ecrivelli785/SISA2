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
    redirect_to(clientes_path, alert: "Empty field!") and return
  else
    @parameter = params[:search].downcase
    @results = Cliente.all.where("lower(nombre) LIKE :search OR lower(apellido) LIKE :search OR lower(domicilio) LIKE :search  OR lower(telefono) LIKE :search OR lower(CUIT) LIKE :search OR lower(correo) LIKE :search OR lower(cliente_tipo) LIKE :search OR (celular) LIKE :search OR (celular) LIKE :search", search: "%#{@parameter}%")
  end
  end
   def searchwindow
  if params[:searchwindow].blank?
    redirect_to(certificados_path, alert: "Empty field!") and return
  else
    @parameter = params[:search].downcase
    @results = Cliente.all.where("lower(nombre) LIKE :search OR lower(apellido) LIKE :search OR lower(domicilio) LIKE :search OR lower(telefono) LIKE :search OR lower(CUIT) LIKE :search OR lower(correo) LIKE :search OR lower(cliente_tipo) LIKE :search OR (celular) LIKE :search", search: "%#{@parameter}%")
  end
  end
  def searchcertificado
    @certificados = Certificado.joins(:cliente)
    if params[:search].blank?
      redirect_to(certificados_path, alert: "Empty field!") and return
    else
    @parameter = params[:search].downcase
    @results = Certificado.joins(:cliente).where("lower(nombre) LIKE :search OR lower(apellido) LIKE :search OR lower(superficie) LIKE :search OR lower(vector) LIKE :search OR lower(tratamiento) LIKE :search OR lower(droga) LIKE :search OR lower(codigo) LIKE :search", search: "%#{@parameter}%")
    if @results.blank?
      @results = Certificado.all.where("cast(nro_certificado as varchar) LIKE :search OR cast(fecha_aplicacion as varchar) LIKE :search OR cast(fecha_vencimiento as varchar) LIKE :search", search: "%#{@parameter}%")
    end
  end
end
  def searchtecnico
    if params[:search].blank?
      redirect_to(tecnicos_path, alert: "Empty field!") and return
    else
    @parameter = params[:search].downcase
    @results = Tecnico.all.where("lower(nombre) LIKE :search OR lower(apellido) LIKE :search OR lower(domicilio) LIKE :search OR lower(telefono) LIKE:search",search: "%#{@parameter}%")
    if @results.blank?
      @results = Tecnico.all.where("cast(dni as varchar) LIKE :search", search: "%#{@parameter}%")
    end
  end
end
end
