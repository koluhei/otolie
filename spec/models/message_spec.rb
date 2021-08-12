require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @creator = FactoryBot.create(:creator)
    @chat = FactoryBot.create(:chat, user_id: @user.id, creator_id: @creator.id)
    @message = FactoryBot.build(:message, chat_id: @chat.id)
  end
  describe 'メッセージ機能' do
    context 'メッセージが送れるとき' do
      it 'チャットルームとユーザーに紐づいており、テキストがあれば送信できる' do
        @message.user_id = @user.id
        expect(@message).to be_valid
      end
      it 'チャットルームとクリエイターに紐づいており、テキストがあれば送信できる' do
        @message.creator_id = @creator.id
        expect(@message).to be_valid
      end
    end
    context 'メッセージが送れないとき' do
      it 'テキストがないと送信できない' do
        @message.text = ''
        @message.user_id = @user.id
        @message.valid?
        expect(@message.errors.full_messages).to include('テキストを入力してください')
      end
      it 'チャットルームが紐づいていなければ送信できない' do
        @message.chat = nil
        @message.user_id = @user.id
        @message.valid?
        expect(@message.errors.full_messages).to include('チャットルームを入力してください')
      end
      it 'ユーザーとクリエイター両方に紐づいていると送信できない' do
        @message.user_id = @user.id
        @message.creator_id = @creator.id
        @message.valid?
        expect(@message.errors.full_messages).to include('ユーザーまたはクリエイターのどちらか一方を入力してください')
      end
      it 'ユーザーにもクリエイターにも紐づいていないときは送信できない' do
        @message.user = nil
        @message.creator = nil
        @message.valid?
        expect(@message.errors.full_messages).to include('ユーザーまたはクリエイターのどちらか一方を入力してください')
      end
    end
  end
end
