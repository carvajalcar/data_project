class CreateStatistics < ActiveRecord::Migration[7.1]
  def change
    create_table :statistics do |t|
      t.integer :points
      t.integer :rebounds
      t.integer :assists
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
