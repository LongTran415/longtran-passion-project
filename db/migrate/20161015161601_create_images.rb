class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :data_file_name
      t.integer :data_file_size
      t.string :data_content_type
      t.datetime :data_updated_at
      t.integer :country_id

      t.integer :portfolio_id
    end
  end
end
