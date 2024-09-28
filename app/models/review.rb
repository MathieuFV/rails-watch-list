class Review < ApplicationRecord
  belongs_to :list
  belongs_to :user, optional: true

  validates :content, presence: true
  validates :rating, presence: true, inclusion: { in: 1..5 }
end
