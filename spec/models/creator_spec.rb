require 'rails_helper'

RSpec.describe Creator, type: :model do
  
  before do
    @creator = FactoryBot.build(:creator)
  end

  describe 'クリエイター新規登録' do
    context 'クリエイター登録できるとき' do
      it '全てのカラムに値が入っていれば登録できる' do
        expect(@creator).to be_valid
      end
      it 'プロフィール画像がなくても登録できる' do
        @creator.image = nil
        expect(@creator).to be_valid
      end
      it 'パスワードが6文字で登録できる' do
      @creator.password = Faker::Lorem.characters(number: 6)
      @creator.password_confirmation = @creator.password
      expect(@creator).to be_valid
      end
    end
    context 'クリエイター登録できないとき' do
      it 'クリエイター名がなければ登録できない' do 
        @creator.name = ''
        @creator.valid?
        expect(@creator.errors.full_messages).to include('クリエイター名を入力してください')
      end
      it 'プロフィールがなければ登録できない' do
        @creator.profile = ''
        @creator.valid?
        expect(@creator.errors.full_messages).to include('プロフィールを入力してください')
      end
      it 'Eメールがなければ登録できない' do
        @creator.email = ''
        @creator.valid?
        expect(@creator.errors.full_messages).to include('Eメールを入力してください')
      end
      it 'Eメールに@がなければ登録できない' do
        @creator.email = Faker::Lorem.characters(number: 10)
        @creator.valid?
        expect(@creator.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'Eメールが重複していると登録できない' do
        @creator.save
        another_creator = FactoryBot.build(:creator, email: @creator.email)
        another_creator.valid?
        expect(another_creator.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'パスワードがなければ登録できない' do
        @creator.password = ''
        @creator.password_confirmation = @creator.password
        @creator.valid?
        expect(@creator.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'パスワードが6文字未満だと登録できない' do
        @creator.password = Faker::Internet.password(min_length: 1, max_length: 5)
        @creator.password_confirmation = @creator.password
        @creator.valid?
        expect(@creator.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it '確認用パスワードがパスワードと一致していなければ登録できない' do
        @creator.password_confirmation = ''
        @creator.valid?
        expect(@creator.errors.full_messages).to include('確認用パスワードとパスワードの入力が一致しません')
      end
    end
  end
end
