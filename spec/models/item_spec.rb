require 'rails_helper'
describe User do
  before do
    @item = FactoryBot.build(:item)
  end

  describe Item do
    context 'itemが保存されるとき' do
      it '全ての項目が満たされていれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it '商品画像が無ければ登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名がなければ登録できない" do
        @item.name = ""
        @item.valid? 
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end  
      it '商品説明がなければ登録できない' do
        @item.info = ""
        @item.valid? 
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'カテゴリーの情報がなければ登録できない' do
        @item.category_id = ""
        @item.valid? 
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態についての情報がなければ登録できない' do
        @item.status_id = ""
        @item.valid? 
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '配送料の負担についての情報がなければ登録できない' do
        @item.burden_id = ""
        @item.valid? 
        expect(@item.errors.full_messages).to include("Burden can't be blank")
      end
      it '発送元の地域についての情報がなければ登録できない' do
        @item.area_id = ""
        @item.valid? 
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it '発送まで日数についての情報がなければ登録できない' do
        @item.ship_id = ""
        @item.valid? 
        expect(@item.errors.full_messages).to include("Ship can't be blank")
      end
      it '価格についての情報がなければ登録できない' do
        @item.value = ""
        @item.valid? 
        expect(@item.errors.full_messages).to include("Value can't be blank")
      end
      it '299円以下では登録できないこと' do
        @item.value = "120"
        @item.valid? 
        expect(@item.errors.full_messages).to include("Value must be greater than or equal to 300")
      end
      it '10,000,000以上では登録できないこと' do
        @item.value = "12000000"
        @item.valid? 
        expect(@item.errors.full_messages).to include("Value must be less than or equal to 9999999")
      end
      it 'categoryのidが0のとき（−−が選択されたとき）に登録できない' do
        @item.category_id = 0
        @item.valid? 
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it 'statusのidが0のとき（−−が選択されたとき）に登録できない' do
        @item.status_id = 0
        @item.valid? 
        expect(@item.errors.full_messages).to include("Status must be other than 0")
      end
      it 'burdenのidが0のとき（−−が選択されたとき）に登録できない' do
        @item.burden_id = 0
        @item.valid? 
        expect(@item.errors.full_messages).to include("Burden must be other than 0")
      end
      it 'areaのidが0のとき（−−が選択されたとき）に登録できない' do
        @item.area_id = 0
        @item.valid? 
        expect(@item.errors.full_messages).to include("Area must be other than 0")
      end
      it 'shipのidが0のとき（−−が選択されたとき）に登録できない' do
        @item.ship_id = 0
        @item.valid? 
        expect(@item.errors.full_messages).to include("Ship must be other than 0")
      end
    end
  end
end







