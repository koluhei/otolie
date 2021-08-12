require 'rails_helper'

RSpec.describe OrderRequest, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @creator = FactoryBot.create(:creator)
    @plan = FactoryBot.create(:plan, creator_id: @creator.id)
    @order_request = FactoryBot.build(:order_request, plan_id: @plan.id, user_id: @user.id)
  end

  describe '作曲依頼' do
    context '作曲依頼できるとき' do
      it '全てのカラムに値が入っていれば依頼できる' do
        expect(@order_request).to be_valid
      end
    end
    context '作曲依頼できないとき' do
      it '使用用途がなければ依頼できない' do
        @order_request.purpose = ''
        @order_request.valid?
        expect(@order_request.errors.full_messages).to include('使用用途を入力してください')
      end
      it '要望がなければ依頼できない' do
        @order_request.demand = ''
        @order_request.valid?
        expect(@order_request.errors.full_messages).to include('要望を入力してください')
      end
      it 'カード情報がなければ依頼できない' do
        @order_request.token = ''
        @order_request.valid?
        expect(@order_request.errors.full_messages).to include('カード情報を入力してください')
      end
      it 'プランが紐づいていないと購入できない' do
        @order_request.plan_id = nil
        @order_request.valid?
        expect(@order_request.errors.full_messages).to include('プランを入力してください')
      end
      it 'ユーザーが紐づいていないと購入できない' do
        @order_request.user_id = nil
        @order_request.valid?
        expect(@order_request.errors.full_messages).to include('ユーザーを入力してください')
      end
    end
  end
end
