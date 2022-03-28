require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品の出品' do
    context '商品の出品ができる場合' do
      it '商品の画像、名前、説明、カテゴリー、状態、配送料の負担、発送元の地域、発送までの日数、価格が存在すると出品できる' do
        expect(@product).to be_valid
      end
    end
    context '商品の出品ができない場合' do
      it '商品画像が無いと出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が無いと出品できない' do
        @product.products_name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Products name can't be blank")
      end
      it '商品の説明が無いと出品できない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリー情報が無いと出品できない' do
        @product.category = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it '状態の情報が無いと出品できない' do
        @product.condition = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担の情報が無いと出品できない' do
        @product.delivery_change = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery change can't be blank")
      end
      it '発送元の情報が無いと出品できない' do
        @product.delivery_source = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery source can't be blank")
      end
      it '発送までの日数の情報が無いと出品できない' do
        @product.preparation_period = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Preparation period can't be blank")
      end
      it '価格の情報が無いと出品できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it '価格は¥300より下だと出品できない' do
        @product.price = '299'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is invalid")
      end
      it '価格は¥9,999,999より多いと出品できない' do
        @product.price = '10000000'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is invalid")
      end
      it '価格は全角数字だと出品できない' do
        @product.price = '５０００'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is invalid")
      end
    end
  end
end
