class User < ApplicationRecord
  has_secure_password

  has_many :reports, dependent: :destroy
  has_many :comments, dependent: :destroy

  enum :role, { doctor: 0, reviewer: 1, admin: 2 }
  validates :email, presence: true, uniqueness: true
end
