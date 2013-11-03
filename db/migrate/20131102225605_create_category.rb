class CreateCategory < ActiveRecord::Migration
  def up
    create_table :categories do |t|
      t.references :page
      t.string:external_id
      t.string:name
      t.timestamps
    end
  end

  def down
    drop_table :categories
  end
end
