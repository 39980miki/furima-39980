require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @order = FactoryBot.build(:order)
    @address = FactoryBot.build(:address)
  end

  context '内容に問題がない場合' do
    it 'postcodeとprefecture_id、city、block、phone_numberがあれば保存できること' do
      expect(@address).to be_valid
    end
  end
end
