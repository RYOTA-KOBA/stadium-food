class Comment < ApplicationRecord
  belongs_to :post

  validates :comment, presence: true, length: { maximum: 1000 }
end
