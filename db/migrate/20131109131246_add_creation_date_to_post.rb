class AddCreationDateToPost < ActiveRecord::Migration
  def change
    add_column :posts, :creation_time, :datetime
  end
end
