class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.text :content
      t.string :position
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
