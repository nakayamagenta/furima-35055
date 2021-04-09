require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it 'nameとemail、passwordとpassword_confirmationとニックネームと生年月日が存在すれば登録できること' do
      expect(@user).to be_valid
    end

      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
     end
    
     it 'passwordとpassword_confirmationが５文字以下だと登録できないこと'do
     @user.password = '1a3b5'
     @user.password_confirmation = '1a3b5'
     @user.valid?
     expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordとpassword_confirmationが６文字以上で半角英数字で一致していれば登録できること'do
    @user.password = 'abc123'
    @user.password_confirmation = 'abc123'
    expect(@user).to be_valid
    end

    it 'passwordとpassword_confirmationが半角英数字でないと登録できない'do
    @user.password = 'あいうえおか'
    @user.password_confirmation = 'あいうえおか'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid")
     end

    it 'passwordとpassword_confirmationが一致していれば登録できる'do
    @user.password = '1a2b3'
    @user.password_confirmation = '1a2b3c4'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

    it "'passwordとpassword_confirmationに数字のみでは登録できない"do  
    @user.password ='123456'
    @user.password_confirmation = '123456'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid")
     end

     it "'passwordとpassword_confirmationに英字のみでは登録できない"do  
    @user.password ='abcdef'
    @user.password_confirmation = 'abcdef'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "emailが空では登録できない" do
      @user.email = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "emailが重複が存在する場合登録できない"do
    @user.save
    another_user = FactoryBot.build(:user, email: @user.email)
    another_user.valid?
    expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
 
    it "emailに＠がないと登録できない"do
    @user.email = 'hogehuga.com'
    @user.valid?
    expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "emailが重複していなくて＠があれば登録できる" do
      @user.email = 'hogehuga@com'
      expect(@user).to be_valid
    end

    it "first_nameが空では登録できない"do
    @user.first_name=''
    @user.valid?
    expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "last_nameが空では登録できない"do
    @user.last_name=''
    @user.valid?
    expect(@user.errors.full_messages).to include ("Last name can't be blank")
    end

    it "first_name_kanaが空では登録できない"do
    @user.first_name_kana=''
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "last_name_kanaが空では登録できない"do
    @user.last_name_kana=''
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it "first_nameは全角での入力でないと登録できない"do
    @user.first_name ='yamada'
    @user.valid?
    expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it "last_nameは全角での入力でないと登録できない"do
    @user.last_name ='yamada'
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it "last_nameとfirst_nameは全角であれば登録できる"do
    @user.last_name ='山田'
    @user.first_name ='太郎'
    expect(@user).to be_valid
    end

    it "last_name_kanaは全角カタカナでの入力でないと登録できない"do
    @user.last_name_kana ='yamada'
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end

    it "first_name_kanaは全角での入力でないと登録できない"do
    @user.first_name_kana ='yamada'
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it "first_name_kanaとlast_name_kanaは全角カナでの入力であれば登録できる"do
    @user.first_name_kana ='タロウ'
    @user.last_name_kana ='ヤマダ'
    expect(@user).to be_valid
    end
  
    it "生年月日が空では登録できない"do  
    @user.birthday =''
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthday can't be blank")
     end

    it "nicknameが空では登録できない"do  
    @user.nickname =''
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
    end
  end

