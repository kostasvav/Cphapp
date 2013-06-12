class AddImageToPlaces < ActiveRecord::Migration
  def change
  	add_column :places, :image_file_name, :string
  	add_column :places, :image_content_type, :string
  	add_column :places, :image_file_size, :integer
  	add_column :places, :image_updated_at, :datetime
  end
end
