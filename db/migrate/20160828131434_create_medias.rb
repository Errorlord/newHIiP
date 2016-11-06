class CreateMedias < ActiveRecord::Migration
  def change
    create_table :medias do |t|
      t.string :position
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
