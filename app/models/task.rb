class Task < ApplicationRecord
  extend TaskExtend

  belongs_to :user
  has_many :inspections, dependent: :destroy

  default_scope { order("updated_at desc")}

  before_create do |record|
    today = Time.now
    count = Task.where(created_at: today.midnight..today.end_of_day).count + 1
    record.title = created_at.strftime("%Y-%m-%d") + " (" + count.to_s + ")"
  end

end
