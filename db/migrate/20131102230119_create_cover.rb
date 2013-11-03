class CreateCover < ActiveRecord::Migration
  def up
    create_table :covers do |t|
      t.references :page
      t.string :external_id
      t.string:source
      t.string:offset_x
      t.string:offset_y
      t.timestamps
    end
  end

  def down
    drop_table :covers
  end
end
