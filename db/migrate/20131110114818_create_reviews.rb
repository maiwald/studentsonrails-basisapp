class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :cookbook_id

      t.timestamps
    end
  end
end
