require 'rails_helper'

RSpec.describe Plan, type: :model do

  before do
    @creator = FactoryBot.create(:creator)
    @plan = FactoryBot.build(:plan, creator_id: @creator.id)
  end

  describe '作曲プラン登録' do
    context 'プランが登録できるとき' do
      it '全てのカラムに値が入っていれば登録できる' do
        expect(@plan).to be_valid
      end
      it '価格が100円以上なら登録できる' do
        @plan.price = 100
        expect(@plan).to be_valid
      end
      it '価格が999,999円以下なら登録できる' do
        @plan.price = 999999
        expect(@plan).to be_valid
      end
    end
    context 'プランが登録できないとき' do
      it 'プラン名がなければ登録できない' do
        @plan.course = ''
        @plan.valid?
        expect(@plan.errors.full_messages).to include('プラン名を入力してください')
      end
      it 'プラン内容がなければ登録できない' do
        @plan.description = ''
        @plan.valid?
        expect(@plan.errors.full_messages).to include('プラン内容を入力してください')
      end
      it '価格がないと登録できない' do
        @plan.price = ''
        @plan.valid?
        expect(@plan.errors.full_messages).to include('価格を入力してください')
      end
      it '価格は100円以上でないと登録できない' do
        @plan.price = Faker::Number.between(from: 1, to: 99)
        @plan.valid?
        expect(@plan.errors.full_messages).to include('価格は100以上の値にしてください')
      end
      it '価格は999,999円以下でないと登録できない' do
        @plan.price = Faker::Number.number(digits: 7)
        @plan.valid?
        expect(@plan.errors.full_messages).to include('価格は999999以下の値にしてください')
      end
      it '価格は全角数字では登録できない' do
        @plan.price = '１０００'
        @plan.valid?
        expect(@plan.errors.full_messages).to include('価格は数値で入力してください')
      end
      it '納期がないと登録できない' do
        @plan.delivery = ''
        @plan.valid?
        expect(@plan.errors.full_messages).to include('納期を入力してください')
      end
      it 'クリエイターが紐づいていないと登録できない' do
        @plan.creator = nil
        @plan.valid?
        expect(@plan.errors.full_messages).to include('クリエイターを入力してください')
      end
    end
  end
end
