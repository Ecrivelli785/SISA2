json.extract! certificado, :id, :nro_certificado, :fecha_aplicacion, :fecha_vencimiento, :hora_aplicacion, :tratamiento, :vector, :superficie, :droga, :codigo, :observaciones_certificado, :estado, :cliente_id, :created_at, :updated_at
json.url certificado_url(certificado, format: :json)
