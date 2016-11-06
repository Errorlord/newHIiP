class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.text :position
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
