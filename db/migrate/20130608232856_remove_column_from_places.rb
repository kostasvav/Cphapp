class RemoveColumnFromPlaces < ActiveRecord::Migration
  def up
    remove_column :places, :image_url
  end

  def down
    add_column :places, :image_url, :string
  end
end
