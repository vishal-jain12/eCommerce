class Product
  include Mongoid::Document

  field :name, type: String
  field :description, type: String
  field :price, type: Float
  field :make, type: Integer

  has_many :cart_items, dependent: :destroy
end
