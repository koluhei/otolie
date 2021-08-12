class Message < ApplicationRecord
  validates :text, presence: true
  validate :required_either_user_id_or_creator_id

  belongs_to :creator, optional: true
  belongs_to :user, optional: true
  belongs_to :chat


  def required_either_user_id_or_creator_id
    return if user_id.present? ^ creator_id.present?
    errors.add(:base, 'ユーザーまたはクリエイターのどちらか一方を入力してください')
  end
end
