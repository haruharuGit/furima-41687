class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shipping_date

  belongs_to :user
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id, nunmericality: { other_than: 1, message: "can't be blank" }
    validates :condition_id, nunmericality: { other_than: 1, message: "can't be blank" }
    validates :postage_id, nunmericality: { other_than: 1, message: "can't be blank" }
    validates :prefecture_id, nunmericality: { other_than: 1, message: "can't be blank" }
    validates :shipping_date_id, nunmericality: { other_than: 1, message: "can't be blank" }
    validates :price
  end
end
