class Item < ApplicationRecord
  with_options presence: true do
    validates :product
    validates :category_id
    validates :price
    validates :condiction_id
    validates :shipping_area_id
    validates :shipping_day_id
    validates :explanation
    validates :shipping_chager_id
    validates :image
  end

  with_options numericality: {other_than: 1, message: "can't be blank"} do
    validates :category_id
    validates :condiction_id
    validates :shipping_area_id
    validates :shipping_day_id
    validates :shipping_chager_id
  end

  validates :price, numericality: { only_integer: true,
  greater_than: 299, less_than: 10000000}
  VALID_PRICEL_REGEX =                 /\A[0-9]+\z/

  belongs_to :user
  has_one_attached :image
end
