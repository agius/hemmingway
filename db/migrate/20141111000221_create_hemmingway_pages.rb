class CreateHemmingwayPages < ActiveRecord::Migration
  def change
    create_table :hemmingway_pages do |t|
      t.string :url
      t.string :locale
      t.text :html

      t.timestamps
    end
  end
end
