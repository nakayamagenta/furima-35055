require 'rails_helper'

RSpec.describe Item, type: :model do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品の出品登録' do
      context '商品の登録がうまくいくとき' do
       it '商品名と商品の説明、カテゴリー、商品の状態、地域、日数、配送料、販売価格と画像が必須であること' do
        expect(@item).to be_valid
       end

       it '販売価格は、¥300~¥9,999,999の間のみで半角数字のみ保存可能であること' do
        @item.price = '99999'
        expect(@item).to be_valid
       end

      it '商品名が４０文字までだと登録できる' do
        @item.product = 'おもちゃ'
        expect(@item).to be_valid
      end

      it '商品の説明が４００文字未満だと登録できる' do
        @item.explanation = '寿司美味しいよね'
        expect(@item).to be_valid
        end
      end
    end

    context '商品の登録がうまくいかないとき' do
      it '商品名が空だと登録できない'do
      @item.product= ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product can't be blank")
      end

      it '商品の説明が空だと登録できない'do
      @item.explanation= ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'カテゴリーが空だと登録できない'do
      @item.category_id= ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態が空だと登録できない'do
      @item.condiction_id= ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Condiction can't be blank")
      end

      it '発送地域が空だと登録できない'do
      @item.shipping_area_id= ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end

      it '発送日数が空と登録できない'do
      @item.shipping_day_id= ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

      it '配送料が空だと登録できない'do
      @item.shipping_day_id= ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

      it '販売価格が空だと登録できない'do
      @item.price=''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格が半角数字以外だと登録できない'do
      @item.price='１２３４５'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it '販売価格が300〜99999999以外だと登録できない'do
      @item.price='299'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 299")
    end

    it '写真が空と登録できない'do
    @item.image=nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'userが紐付いていないと保存できないこと'do
    @item.user=nil
    @item.valid?
    expect(@item.errors.full_messages).to include("User must exist")
    end
  end
end
