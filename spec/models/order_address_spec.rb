require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @order_address = FactoryBot.build(:order_address, user_id: user.id)
    end

    context '内容に問題がない場合' do
      it "全ての値が正しく入力されていれば保存できること" do
        # expect(@order_address).to be_valid
      end
      it "buildingは空でも保存できること" do
      end
    end

    context '内容に問題がある場合' do
      it "postcodeが空だと保存できないこと" do
      end
      it "postcodeが半角のハイフンを含んだ正しい形式出ないと保存できないこと" do
      end
    end
  end

end
