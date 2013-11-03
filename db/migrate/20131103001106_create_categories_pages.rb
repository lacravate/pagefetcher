class CreateCategoriesPages < ActiveRecord::Migration
  def up
    create_table :categories_pages do |t|
      t.references :page
      t.references :category
    end
  end

  def down
    drop_table :categories_pages
  end
end
