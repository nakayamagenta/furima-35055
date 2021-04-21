class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :phone_number, :shipping_area_id, :municipality, :address, :building_name, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality, format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ }
    validates :address, format:  {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])|\A[0-9０-９]+\z/ }
    validates :token
  end

  def save
    # 寄付情報を保存し、変数donationに代入する
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Address.create(postal_code: postal_code, phone_number: phone_number, shipping_area_id: shipping_area_id,  municipality: municipality, address: address, building_name: building_name, purchase_id: purchase.id)
  end
end