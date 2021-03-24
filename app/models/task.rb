class Task < ApplicationRecord
  has_one_attached :eyecatch
  belongs_to :board
  has_many :comments, dependent: :destroy
end
