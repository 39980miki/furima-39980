class Order < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :hoge,:fug

  validates :user_id, presence: true
  validates :item, presence: true

  def save
    # 各テーブルにデータを保存する処理を書く
    return false unless valid? #バリデーションが通らない場合は保存しない
    item = Item.new(:item_name, :price)
    item.save
    #保存に成功したらtrueを返す
    true
  end
end
