json.extract! cliente, :id, :apellido, :nombre, :domicilio, :celular, :telefono, :estado, :estado_mkt, :cuit, :correo, :observaciones_cliente, :rubro, :cliente_tipo, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
