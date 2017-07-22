class Inspection < ApplicationRecord
  belongs_to :task
  belongs_to :category

  has_one :user, through: :task
  # delegate :user, to: :task

  validates :id, uniqueness: { scope: [:task_id, :category_id]}
end
