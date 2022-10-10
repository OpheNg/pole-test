class Host < ApplicationRecord
  has_many :sessions, dependent: :destroy
  has_one_attached :photo
  # has_many :users, through: :sessions, dependent: :destroy
  belongs_to :user
end
