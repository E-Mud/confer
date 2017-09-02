class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :encrypted_password
      t.string :encrypted_password_iv
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
