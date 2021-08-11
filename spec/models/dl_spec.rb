require 'rails_helper'

RSpec.describe Dl, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @creator = FactoryBot.create(:creator)
    @song = FactoryBot.create(:song, creator_id: @creator.id)
    @dl = FactoryBot.create(:dl, user_id: @user.id, song_id: @song.id)
  end

  describe '音楽の購入' do
    context '音楽の購入ができるとき' do
      it '全てのカラムに値が入っていれば購入できる' do
        expect(@dl).to be_valid
      end
    end
    context '音楽の購入ができないとき' do
      it '紐づいているユーザーがいないとき'do
        @dl.user = nil
        @dl.valid?
        expect(@dl.errors.full_messages).to include('Userを入力してください')
      end
      it '紐づいている音楽がないとき' do
        @dl.song = nil
        @dl.valid?
        expect(@dl.errors.full_messages).to include('Songを入力してください')
      end
      it 'カード情報がなければ購入できない' do
        @dl.token = ''
        @dl.valid?
        expect(@dl.errors.full_messages).to include('カード情報を入力してください')
      end
    end

  end
end
