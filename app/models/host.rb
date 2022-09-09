class Host < ApplicationRecord
  has_many :sessions, dependent: :destroy
  has_one_attached :photo
  belongs_to :user
end
