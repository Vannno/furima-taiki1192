require 'rails_helper'

 RSpec.describe User, type: :model do
   before do
    @user = FactoryBot.build(:user)
 end


  describe 'ユーザー新規登録' do
    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid? 
        expect(@user.errors.full_messages)
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages)
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages)
      end
      it "emailは@を含まないといけない" do
        @user.email = "go"
        @user.valid?
        expect(@user.errors.full_messages)
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages)
      end
      it "passwordが６文字でないと登録できない" do
        @user.password = "12ab"
        @user.password_confirmation = "12ab"
        @user.valid?
        expect(@user.errors.full_messages)
      end
      it "passswordは半角英数字混合でなければならない" do
        @user.password = '1234'
        @user.valid?
        expect(@user.errors.full_messages)
      end
      it "passwordは確認用含めて２回入力しなければならない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages)
      end
      it "lastnameが必須でなければならない" do
        @user.lastname = ""
        @user.valid?
        expect(@user.errors.full_messages)
      end
      it "firstnameが必須でなければならない" do
        @user.firstname = ""
        @user.valid?
        expect(@user.errors.full_messages)
      end
      it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）でなければならない" do
        @user.firstname = "1234"
        @user.valid?
        expect(@user.errors.full_messages)
      end
      it "katakana_lastnameは、必須でなければならない" do
        @user.katakana_lastname = ""
        @user.valid?
        expect(@user.errors.full_messages)
      end
      it "katakana_firstnameは全角（カタカナ）での入力が必須でなければならない" do
        @user.katakana_firstname = ""
        @user.valid?
        expect(@user.errors.full_messages)
      end
      it "birthdayが必須でなければならない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages)
      end    
    end
  end
end



