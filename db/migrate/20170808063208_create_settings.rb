class CreateSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :settings do |t|
      t.boolean :fan_status
      t.timestamps
    end
  end
end
