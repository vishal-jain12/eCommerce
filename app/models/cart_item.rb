class CartItem
  include Mongoid::Document

  field :quantity, type: Integer

  belongs_to :product
  belongs_to :cart
end
