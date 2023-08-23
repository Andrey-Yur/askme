class Answer < ApplicationRecord
  belongs_to :question
  validates :body, presence: true
  accepts_nested_attributes_for :question
end
