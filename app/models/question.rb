class Question < ApplicationRecord
  has_one :answer
  # dependent: :destroy
  validates :body, presence: true
  validates :user_id, presence: true
end
