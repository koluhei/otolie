require 'rails_helper'
RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録できるとき' do
      it '全てのカラムに値が入っていれば登録できる' do
        expect(@user).to be_valid
      end
      it 'プロフィール画像がなくても登録できる' do
        @user.image = nil
        expect(@user).to be_valid
      end
      it 'パスワードが6文字で登録できる' do
      @user.password = Faker::Lorem.characters(number: 6)
      @user.password_confirmation = @user.password
      expect(@user).to be_valid
      end
    end
    context 'ユーザー登録できないとき' do
      it 'ユーザー名がなければ登録できない' do 
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ユーザー名を入力してください')
      end
      it 'プロフィールがなければ登録できない' do
        @user.profile = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('プロフィールを入力してください')
      end
      it 'Eメールがなければ登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it 'Eメールに@がなければ登録できない' do
        @user.email = Faker::Lorem.characters(number: 10)
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'パスワードがなければ登録できない' do
        @user.password = ''
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'パスワードが6文字未満だと登録できない' do
        @user.password = Faker::Internet.password(min_length: 1, max_length: 5)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it '確認用パスワードがパスワードと一致していなければ登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('確認用パスワードとパスワードの入力が一致しません')
      end
    end
  end
end
