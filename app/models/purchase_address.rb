class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :phone_number, :shippping_area_id, :municipality, :address, :building_name, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :shippping_area_id, numericality: { other_than: 1, message: "can't be blank" }
    #validates :municipality, format: {with /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ }
    #validates :address, format:  {with /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])|\A[0-9０-９]+\z/ }
    #validates :building_name, format:  {with /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])|\A[0-9０-９]+\z/ }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    address = Address.create(postal_code: postal_code, phone_number: phone_number, shipping_area_id: shipping_area_id, municipality: municipality, address: address, building_name: building_neme)
  end
end