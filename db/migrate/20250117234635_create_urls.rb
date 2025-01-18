# db/migrate/YYYYMMDD_create_urls.rb
class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :original_url, null: false
      t.string :short_code, null: false, unique: true
      t.timestamps
    end
  end
end
