class Inspection < ApplicationRecord
  belongs_to :task
  belongs_to :category

  has_one :user, through: :task
  # delegate :user, to: :task

  validates :id, uniqueness: { scope: [:task_id, :category_id]}

  before_save do |record|
    record.task.touch
  end

  def value=(val)
    if index = category.options.present? && category.options.split('|').index(val)
      self[:value] = index
    else
      self[:value] = val
    end
  end
end
