class CreateApps < ActiveRecord::Migration[5.0]
  def change
    create_table :apps do |t|
      t.string :name
      t.references :account, foreign_key: true
      t.references :creator, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
