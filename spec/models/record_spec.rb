require 'rails_helper'
  describe User do
    before do
      @user = FactoryBot.build(:user)
      @item = FactoryBot.build(:item)
      @purchases = FactoryBot.build(:purchase)
    end
  

      describe Record do
        context '商品の購入が成功するとき' do
          it '全ての項目が満たされていれば,商品の購入ができる' do
            expect(@purchases).to be_valid
          end
          it 'building_nameが入力されていなくても購入ができる' do
            @purchases.building_name = ""
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
      it '都道府県で、0（−−）が選択されたときに登録できない' do
        @purchases.prefecture_id = 0
        @purchases.valid? 
        expect(@purchases.errors.full_messages).to include ("Prefecture must be other than 0")
      end
      it '都道府県が空だと登録できない' do
        @purchases.prefecture_id = ""
        @purchases.valid? 
        expect(@purchases.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
      end
      it 'tokenが空だと登録出来ないこと' do
        @purchases.token = ""
        @purchases.valid?
        expect(@purchases.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end    
