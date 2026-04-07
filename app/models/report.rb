class Report < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  enum :severity, { low: 0, medium: 1, high: 2 }
  enum :status, { draft: 0, submitted: 1, under_review: 2, approved: 3, rejected: 4 }

  validates :title, :description, presence: true
end
