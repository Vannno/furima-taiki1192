require 'rails_helper'
    describe User do
      before do
        @user = FactoryBot.build(:user)
        @item = FactoryBot.build(:item)
        @purchases = FactoryBot.build(:purchase)
      end

    describe Record do
      context 'itemが保存されるとき' do
        it '全ての項目が満たされていれば,商品の購入ができる' do
          expect(@purchases).to be_valid
        end
      end

    context '商品の購入ができないとき' do
      it '郵便番号の入力がなければ購入できない'do
        @purchases.postal_code = ""
        @purchases.valid?
        expect(@purchases.errors.full_messages).to include("Postal code can't be blank")
      end
      it '市区町村の入力がなければ購入できない' do
        @purchases.city = ""
        @purchases.valid?
        expect(@purchases.errors.full_messages).to include("City can't be blank")
      end
      it '番地の入力がなければ購入できない' do
        @purchases.place = ""
        @purchases.valid?
        expect(@purchases.errors.full_messages).to include("Place can't be blank")
      end
      it '電話番号の入力がなければ購入できない' do
        @purchases.phone_number = ""
        @purchases.valid?
        expect(@purchases.errors.full_messages).to include("Phone number can't be blank")
      end
      it '郵便番号のハイフンがなければ購入できない' do
        @purchases.postal_code = "4760003"
        @purchases.valid?
        expect(@purchases.errors.full_messages).to include("Postal code is invalid")
      end
      it '電話番号にはハイフンの入力があると登録できない' do
        @purchases.phone_number = "090-9999-9999"
        @purchases.valid?
        expect(@purchases.errors.full_messages).to include("Phone number is not a number")
      end
      it '電話番号は11桁以内でなければ登録できない' do
        @purchases.phone_number = "111122223333"
        @purchases.valid?
        expect(@purchases.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
    end
  end
end    
