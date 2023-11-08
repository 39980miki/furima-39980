class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :etd

  #空の投稿を保存できないようにする
  validates :item_name, :description, :category_id, :charge_id, :prefecture_id, :etd_id, presence: true

  #ジャンルの選択が「---」の時は保存できないための記述
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :charge_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :etd_id, numericality: { other_than: 1 , message: "can't be blank"}

  belongs_to :user
  # has_one :purchase
end

