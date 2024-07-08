class CreateClassifications < ActiveRecord::Migration[7.1]
  def change
    create_table :classifications do |t|
      t.references :team, null: false, foreign_key: true
      t.integer :wins
      t.integer :losses

      t.timestamps
    end
  end
end
