class CreatePage < ActiveRecord::Migration

  # table with all the fields gotten from the Graph API
  # maybe we won't make use of all of them but at least
  # we won't need to run migration alterations, and we have
  # an access class to the base data
  def up
    create_table :pages do |t|
      t.string :about
      t.string :awards
      t.string :category
      t.string :checkins
      t.string :description
      t.string :founded
      t.string :is_published
      t.references :location
      t.string :mission
      t.string :phone
      t.string :products
      t.string :talking_about_count
      t.string :username
      t.string :website
      t.string :were_here_count
      t.string :external_id
      t.string :name
      t.string :link
      t.string :likes
      t.references :cover
      t.timestamps
    end
  end

  def down
    drop_table :pages
  end
end
