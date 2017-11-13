class ShopSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :address
end
