class VehicleSerializer < ActiveModel::Serializer
  attributes :id, :plate, :branch, :category, :person_id
end
