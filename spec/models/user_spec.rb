require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end


  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全ての項目が満たされていれば登録できる' do
         expect(@user).to be_valid
      end
    end
      
    
    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid? 
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailは@を含まないといけない" do
        @user.email = "go"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが6文字以上でないと登録できない" do
        @user.password = "12ab"
        @user.password_confirmation = "12ab"
        @user.valid?
        expect(@user.errors.full_messages).to include"Password is too short (minimum is 6 characters)"
      end
      it "passswordは半角英字が含まれていないと登録されない" do
        @user.password = 'ａａａａａａ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordは半角数字が含まれていないといけない" do
        @user.password = "１１１１"
        @user.valid?
        expect(@user.errors.full_messages).to include( "Password is invalid")
      end
      it "passwordは確認用含めて２回入力しなければならない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "lastnameが必須でなければならない" do
        @user.lastname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end
      it "firstnameが必須でなければならない" do
        @user.firstname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end
      it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）でなければならない" do
        @user.firstname = "1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname is invalid")
      end
      it "katakana_lastnameは、必須でなければならない" do
        @user.katakana_lastname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana lastname can't be blank")
      end
      it "katakana_firstnameは、必須でなならない" do
        @user.katakana_firstname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana firstname can't be blank")
      end
      it "katakana_firstnameが全角カタカナ以外の場合に登録ができないこと" do
        @user.katakana_firstname = "ﾀｲｷ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana firstname is invalid")
      end  
      it "katakana_lastnameが全角カタカナ以外の場合に登録ができないこと" do
        @user.katakana_lastname = "ﾊﾞﾝﾉ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana lastname is invalid")
      end
      it "birthdayが必須でなければならない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end     
  end
end






