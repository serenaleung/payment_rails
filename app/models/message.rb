class Message < ApplicationRecord
  belongs_to :user

  has_many :splitters, dependent: :destroy
  has_many :users, through: :splitters
end
