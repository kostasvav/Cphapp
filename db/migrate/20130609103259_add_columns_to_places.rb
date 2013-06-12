class AddColumnsToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :business_type, :string
    add_column :places, :location, :string
    add_column :places, :open_hours, :text
    add_column :places, :price_cat, :integer
    add_column :places, :web_url, :string
    add_column :places, :email_url, :string
    add_column :places, :phone_num, :string
    add_column :places, :address, :string
    add_column :places, :longitude, :float
    add_column :places, :latitude, :float
    add_column :places, :gmaps, :boolean
  end
end
