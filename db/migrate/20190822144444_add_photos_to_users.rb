class AddPhotosToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :photo, :string, default: "/assets/no.png"
  end
end
