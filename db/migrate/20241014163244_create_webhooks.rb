class CreateWebhooks < ActiveRecord::Migration[8.0]
  def change
    create_table :webhooks do |t|
      t.references :account, null: false, foreign_key: true
      t.string :name, null: false
      t.string :url, null: false
      t.integer :request_method, null: false

      t.timestamps
    end
  end
end
