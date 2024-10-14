class CreateWebhooks < ActiveRecord::Migration[8.0]
  def change
    create_table :webhooks do |t|
      t.references :account, null: false, foreign_key: true
      t.string :name
      t.string :url
      t.integer :request_method

      t.timestamps
    end
  end
end
