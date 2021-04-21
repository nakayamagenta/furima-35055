require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    describe '購入の保存' do
    context '内容に問題ない場合' do
      it  'postal_code,phone_number,shipping_area_id,municipality,address,building_name,tokenが必須であること' do
      expect(@purchase_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_address.postal_code = '12345６７'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
    
      it 'shipping_area_idを選択していないと保存できないこと' do
       @purchase_address.shipping_area_id= 1
       @purchase_address.valid?
       expect(@purchase_address.errors.full_messages).to include("Shipping area can't be blank")
      end

      it 'municipalityはで空だと保存できないこと' do
        @purchase_address.municipality = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'addressはで空だと保存できないこと' do
        @purchase_address.address= ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'building_nameは空でも保存できること' do
        @purchase_address.building_name= ''
        expect(@purchase_address).to be_valid
      end

      it 'phone_numberが空だと保存できないこと' do
        @purchase_address.phone_number= ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが11桁以内だと保存できないこと' do
        @purchase_address.phone_number= '123456789012'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end

      it "tokenが空では登録できないこと" do
        @purchase_address.token= ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
 