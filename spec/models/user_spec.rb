require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録ができる場合' do
      it 'すべての必要な情報が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー新規登録ができない場合' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_name_readingが空だと登録できない' do
        @user.last_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading can't be blank")
      end
      it 'first_name_readingが空だと登録できない' do
        @user.first_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading can't be blank")
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'emailが重複していると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@がないと登録できない' do
        @user.email = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordは5文字以下だと登録できない' do
        @user.password = 'abcde'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは全角だと登録できない' do
        @user.password = 'Ａｂ１２３４'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordは数字だけだと登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordは英字だけだと登録できない' do
        @user.password = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordとconfirmation_passwordが一致していいないと登録できない' do
        @user.password = 'abcd1234'
        @user.password_confirmation = 'abcd12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameは半角だと登録できない' do
        @user.last_name = 'ｻﾄｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'last_nameは英字だと登録できない' do
        @user.last_name = 'sato'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'last_nameは数字だと登録できない' do
        @user.last_name = '1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'first_nameは半角だと登録できない' do
        @user.first_name = 'ﾊﾅｺ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'first_nameは英字だと登録できない' do
        @user.first_name = 'hanako'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'first_nameは数字だと登録できない' do
        @user.first_name = '1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'last_name_readingは半角だと登録できない' do
        @user.last_name_reading = 'ｻﾄｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name reading is invalid')
      end
      it 'last_name_readingは英字だと登録できない' do
        @user.last_name_reading = 'sato'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name reading is invalid')
      end
      it 'last_name_readingは数字だと登録できない' do
        @user.last_name_reading = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name reading is invalid')
      end
      it 'last_name_readingは漢字だと登録できない' do
        @user.last_name_reading = '佐藤'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name reading is invalid')
      end
      it 'first_name_readingは半角だと登録できない' do
        @user.first_name_reading = 'ﾊﾅｺ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name reading is invalid')
      end
      it 'first_name_readingは英字だと登録できない' do
        @user.first_name_reading = 'hanako'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name reading is invalid')
      end
      it 'first_name_readingは数字だと登録できない' do
        @user.first_name_reading = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name reading is invalid')
      end
      it 'fist_name_readingは漢字だと登録できない' do
        @user.first_name_reading = '花子'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name reading is invalid')
      end
    end
  end
end
