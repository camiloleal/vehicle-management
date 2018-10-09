class PersonSerializer < ActiveModel::Serializer
  attributes :id, :name, :document_number, :document_file

  has_many :vehicles
end
