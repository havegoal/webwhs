class CreateApiKeys < ActiveRecord::Migration[8.0]
  def change
    create_table :api_keys do |t|
      t.references :account, null: false, foreign_key: true

      t.string :name, null: false
      t.string :comment

      t.string :token, limit: 512, null: false

      t.timestamps
    end

    add_index :api_keys, :name, unique: true
  end
end
