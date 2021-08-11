require 'rails_helper'

RSpec.describe Song, type: :model do

  before do
    @song = FactoryBot.build(:song)
  end
  describe '音楽のアップロード' do
    context 'アップロードできるとき' do
      it '全てのカラムに値が入っていればアップロードできる' do
        expect(@song).to be_valid
      end
      it 'アートワークがなくてもアップロードできる' do
        @song.image = nil
        expect(@song).to be_valid
      end
      it '値段が50円以上なら登録できる' do
        @song.price = 50
        expect(@song).to be_valid
      end
      it '値段が1,000,000円未満なら登録できる' do
        @song.price = 999999
        expect(@song).to be_valid
      end
    end
    context 'アップロードできないとき' do
      it 'タイトルが無いとアップロードできない' do
        @song.title = ''
        @song.valid?
        expect(@song.errors.full_messages).to include('タイトルを入力してください')
      end
      it 'オーディオファイルがないとアップロードできない' do
        @song.audio = nil
        @song.valid?
        expect(@song.errors.full_messages).to include('オーディオファイルを選択してください')
      end
      it 'ジャンルが選択されてないとアップロードできない' do
        @song.genre_id = 1
        @song.valid?
        expect(@song.errors.full_messages).to include('ジャンルを選択してください')
      end
      it '曲の説明がないとアップロードできない' do
        @song.description = ''
        @song.valid?
        expect(@song.errors.full_messages).to include('曲の説明を入力してください')
      end
      it '価格が入力されてないとアップロードできない' do
        @song.price = ""
        @song.valid?
        expect(@song.errors.full_messages).to include('価格を入力してください')
      end
      it '価格が50円未満だとアップロードできない' do
        @song.price = Faker::Number.between(from: 1, to: 49)
        @song.valid?
        expect(@song.errors.full_messages).to include('価格は50以上の値にしてください')
      end
      it '価格が1,000,000以上だとアップロードできない' do
        @song.price = Faker::Number.number(digits: 7)
        @song.valid?
        expect(@song.errors.full_messages).to include('価格は999999以下の値にしてください')
      end
      it 'クリエイターが紐づいていないとアップロードできない' do
        @song.creator = nil
        @song.valid?
        expect(@song.errors.full_messages).to include('クリエイターを入力してください')
      end
    end
  end
end
