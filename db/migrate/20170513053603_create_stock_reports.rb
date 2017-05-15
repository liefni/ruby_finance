class CreateStockReports < ActiveRecord::Migration[5.1]
  def change
    create_table :stock_reports do |t|
      t.string :report

      t.timestamps
    end
  end
end
