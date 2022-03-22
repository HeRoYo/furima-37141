require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nickname、email、password、password_confrmation、family_name_kanji、first_name_kanji、family_name_kana、first_name_kana、barth_dayが存在すると登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複しているemailでは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it '@が含まれていないemailでは登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'abc12'
        @user.password_confirmation = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Input half-width characters.')
      end
      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Input half-width characters.')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'family_name_kanjiが空では登録できない' do
        @user.family_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kanji can't be blank")
      end
      it '半角英字が含まれているfamily_name_kanjiでは登録できない' do
        @user.family_name_kanji = 'Tom'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kanji is invalid. Input full-width characters.')
      end
      it '半角数字が含まれているfamily_name_kanjiでは登録できない' do
        @user.family_name_kanji = '36'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kanji is invalid. Input full-width characters.')
      end
      it 'first_name_kanjiが空では登録できない' do
        @user.first_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji can't be blank")
      end
      it '半角英字が含まれているfirst_name_kanjiでは登録できない' do
        @user.first_name_kanji = 'Smith'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kanji is invalid. Input full-width characters.')
      end
      it '半角数字が含まれているfirst_name_kanjiでは登録できない' do
        @user.first_name_kanji = '777'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kanji is invalid. Input full-width characters.')
      end
      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it '漢字が含まれているfamily_name_kanaでは登録できない' do
        @user.family_name_kana = '漢字'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid. Input full-width katakana characters.')
      end
      it 'ひらがなが含まれているfamily_name_kanaでは登録できない' do
        @user.family_name_kana = 'ひらがな'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid. Input full-width katakana characters.')
      end
      it '半角英字が含まれているfamily_name_kanaでは登録できない' do
        @user.family_name_kana = 'Smith'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid. Input full-width katakana characters.')
      end
      it '半角数字が含まれているfamily_name_kanaでは登録できない' do
        @user.family_name_kana = '36'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid. Input full-width katakana characters.')
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it '漢字が含まれているfirst_name_kanaでは登録できない' do
        @user.first_name_kana = '漢字'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters.')
      end
      it 'ひらがなが含まれているfirst_name_kanaでは登録できない' do
        @user.first_name_kana = 'ひらがな'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters.')
      end
      it '半角英字が含まれているfirst_name_kanaでは登録できない' do
        @user.first_name_kana = 'Smith'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters.')
      end
      it '半角数字が含まれているfirst_name_kanaでは登録できない' do
        @user.first_name_kana = '777'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters.')
      end
      it 'barth_dayが空では登録できない' do
        @user.barth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Barth day can't be blank")
      end
    end
  end
end
