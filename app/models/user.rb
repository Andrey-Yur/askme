class User < ApplicationRecord
  has_secure_password
  before_save :downcase_nickname

  validates :email, uniqueness: true
  validates :name, :nickname, :email, presence: true
  validates :password, presence: true, confirmation: true, length: { in: 6..20 }, on: :create

  def downcase_nickname
    nickname.downcase!
  end
end
