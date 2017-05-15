class CreateQuotes < ActiveRecord::Migration[5.1]
  def change
    create_table :quotes do |t|
      t.string :symbol
      t.string :name
      t.decimal :ask
      t.decimal :bid

      t.timestamps
    end
  end
end
