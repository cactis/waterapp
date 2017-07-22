class CreateInspections < ActiveRecord::Migration[5.1]
  def change
    create_table :inspections do |t|
      # t.belongs_to :user
      t.belongs_to :task
      t.belongs_to :category #category_id 8
      t.float :value
      t.timestamps
    end
  end
end
