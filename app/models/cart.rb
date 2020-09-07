class Cart
  include Mongoid::Document

  field :cart_total, type: Float

  has_many :cart_items, dependent: :destroy
  belongs_to :user

  def add_item(product_id)
  product = Product.find_by(id: product_id) rescue nil
  product_price = product.try(:price)
  item = cart_items.where(product_id: product_id).first
  if item.present?
    item.quantity + 1
    item.save
  else
    self.cart_items << CartItem.new(product_id: product_id, quantity: 1)
  end
  self.cart_total += product_price
  self.save
  end
end
