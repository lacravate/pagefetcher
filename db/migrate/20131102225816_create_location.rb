class CreateLocation < ActiveRecord::Migration
  def up
    create_table :locations do |t|
      t.references :page
      t.string:street
      t.string:city
      t.string:state
      t.string:country
      t.string:zip
      t.string:latitude
      t.string:longitude
      t.timestamps
    end
  end

  def down
    drop_table :locations
  end
end
