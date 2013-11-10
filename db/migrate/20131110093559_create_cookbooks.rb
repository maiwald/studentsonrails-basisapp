class CreateCookbooks < ActiveRecord::Migration
  def change
    create_table :cookbooks do |t|
      t.string :isbn, :unique => true
      t.string :author
      t.float :price
      t.string :title

      t.timestamps
    end
  end
end
