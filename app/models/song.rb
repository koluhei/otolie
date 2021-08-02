class Song < ApplicationRecord
  mount_uploader :audio, AudioFileUploader
  mount_uploader :image, ImageUploader

  with_options presence: true do
    validates :title
    validates :audio
    validates :genre_id, numericality: { other_than: 1, message: "can't be blank"} 
    validates :description
    validates :price, numericality: { greater_than_or_equal_to: 50, less_than_or_equal_to: 999999 }
    validates :creator_id
  end

  belongs_to :creator
  has_many :dls, dependent: :destroy
  has_many :users, through: :dls

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
end
