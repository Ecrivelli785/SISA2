class Certificado < ApplicationRecord
  belongs_to :cliente
  DROGA = ['PIRETROYDES', 'BROMADILONE', 'OTROS']
  TRATAMIENTO= ['ASPERSIÓN', 'HUMO', 'NIEBLA', 'OTROS']
  VECTOR = ['INSECTO', 'ROEDORES', 'VOLADORES', 'BACTERIAS', 'OTROS']
  TURNO = ['C', 'F']
end
