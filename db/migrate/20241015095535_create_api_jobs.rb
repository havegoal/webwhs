class CreateApiJobs < ActiveRecord::Migration[8.0]
  def change
    create_table :api_jobs do |t|
      t.references :api_key, null: false, foreign_key: true
      t.string :type, null: false
      t.integer :state, null: false

      t.text :request
      t.text :response

      t.timestamps
    end
  end
end
