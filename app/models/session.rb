class Session < ApplicationRecord
  belongs_to :user
  belongs_to :host
  has_many :users, dependent: :destroy
  has_many :hosts, dependent: :destroy
end
