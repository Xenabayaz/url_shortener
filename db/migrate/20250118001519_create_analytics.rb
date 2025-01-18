class CreateAnalytics < ActiveRecord::Migration[7.1]
  def change
    create_table :analytics do |t|
      t.references :url, null: false, foreign_key: true
      t.datetime :visited_at

      t.timestamps null: false
    end
  end
end
