class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :profile, presence: true

  has_many :dls
  has_many :songs, through: :dls
  has_many :chats, dependent: :destroy
  has_many :messages, dependent: :destroy

  mount_uploader :image, UserImageUploader
end
