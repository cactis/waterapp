class CreateInstections < ActiveRecord::Migration[5.1]
  def change
    create_table :instections do |t|

      t.timestamps
    end
  end
end
