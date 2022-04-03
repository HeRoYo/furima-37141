require 'rails_helper'

RSpec.describe OrderProduct, type: :model do
  describe '商品の購入' do
    before do
      user = FactoryBot.create(:user)
      product = FactoryBot.create(:product)
      # purchase = Purchase.create(user_id: user.id, product_id: product.id)
      @shipping_address = FactoryBot.build(:order_product, user_id: user.id, product_id: product.id)
      sleep 0.1 
    end

    context '商品の購入ができる場合' do
      it '全ての情報が正しく入力されていると購入できる' do
        expect(@shipping_address).to be_valid
      end
      
      it '建物名が空欄でも購入できる' do
        @shipping_address.building = ''
        expect(@shipping_address).to be_valid
      end
    end

    context '商品購入ができない場合' do
      it '郵便番号が無いと購入できない' do
        @shipping_address.post_code = ''
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号に-(ハイフン)が含まれていないと購入できない' do
        @shipping_address.post_code = '1231234'
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '郵便番号が全角数字だと購入できない' do
        @shipping_address.post_code = '１２３-１２３４'
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '郵便番号が「3桁以外-4桁」だと購入できない' do
        @shipping_address.post_code = '12-1234'
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '郵便番号が「3桁-4桁以外」だと購入できない' do
        @shipping_address.post_code = '123-12345'
      end
      it '都道府県の情報が無いと購入できない' do
        @shipping_address.delivery_source_id = nil
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Delivery source can't be blank")
      end
      it '都道府県に「---」が選択されている場合は購入できない' do
        @shipping_address.delivery_source_id = 0
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Delivery source must be other than 0")
      end
      it '市区町村が無いと購入できない' do
        @shipping_address.city = ''
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地の情報が無いと購入できない' do
        @shipping_address.house_number = ''
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が無いと購入できない' do
        @shipping_address.phone_number = ''
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号に-(ハイフン)が含まれていると購入できない' do
        @shipping_address.phone_number = '000-1234-5678'
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Phone number is invalid. Do not include hyphen(-)")
      end
      it '電話番号が全角数字だと購入できない' do
        @shipping_address.phone_number = '０００１２３４５６７８'
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Phone number is invalid. Do not include hyphen(-)")
      end
      it '電話番号が9桁以下だと購入できない' do
        @shipping_address.phone_number = '000123456'
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Phone number is invalid. Do not include hyphen(-)")
      end
      it '電話番号が12桁以上だと購入できない' do
        @shipping_address.phone_number = '000123456789'
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Phone number is invalid. Do not include hyphen(-)")
      end
      it 'userが紐づいていなければ購入できない' do
        @shipping_address.user_id = nil
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it 'productが紐づいていなければ購入できない' do
        @shipping_address.product_id = nil
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Product can't be blank")
      end
      it 'tokenが空では購入できない' do
        @shipping_address.token = nil
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
