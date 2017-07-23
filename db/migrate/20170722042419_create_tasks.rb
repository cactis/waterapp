class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.belongs_to :user
      t.string :title
      t.timestamps
    end
  end
end
