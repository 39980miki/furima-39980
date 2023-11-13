class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :etd

  #空の投稿を保存できないようにする
  validates :image, :item_name, :description, :category_id, :charge_id, :prefecture_id, :etd_id, :price, presence: true

  #ジャンルの選択が「---」の時は保存できないための記述
  validates :category_id, :condition_id, :charge_id, :prefecture_id, :etd_id, numericality: { other_than: 1 , message: "can't be blank"}

  #価格について
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  belongs_to :user
  has_one :order
end
