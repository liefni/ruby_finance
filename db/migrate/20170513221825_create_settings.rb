class CreateSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :settings do |t|
      t.integer :quote_update_interval

      t.timestamps
    end
  end
end
