require 'rails_helper'

RSpec.describe Chat, type: :model do
  before do
    @creator = FactoryBot.create(:creator)
    @user = FactoryBot.create(:user)
    @chat = FactoryBot.build(:chat, creator_id: @creator.id, user_id: @user.id)
  end

  describe 'チャット機能' do
    context 'チャットルームができるとき' do
      it 'ユーザーとクリエイターが紐づいているとチャットルームができる' do
        expect(@chat).to be_valid
      end
    end
    context 'チャットルームができないとき' do
      it 'ユーザーが紐づいていないとチャットルームができない' do
        @chat.user = nil
        @chat.valid?
        expect(@chat.errors.full_messages).to include('ユーザーを入力してください')
      end
      it 'クリエイターが紐づいていないとチャットルームができない' do
        @chat.creator = nil
        @chat.valid?
        expect(@chat.errors.full_messages).to include('クリエイターを入力してください')
      end
    end
  end
end
