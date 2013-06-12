class Place < ActiveRecord::Base

  attr_accessible :category, :description, :name, :image, :business_type, :location, :open_hours, :price_cat, :web_url, :email_url, :phone_num, :address, :longitude, :latitude, :gmaps
	
	before_validation do
		self.phone_num=phone_num.gsub(/\D/, '')
	end
	
	before_validation :format_url
	
	validates_presence_of :name, :category, :description, :business_type, :location
	validates_uniqueness_of :name
	validates_numericality_of :price_cat
	validates_size_of :description, :maximum=> 200, :message=> "The Overview field must be 200 characters maximum"
	validates_length_of :phone_num, :minimum=> 10, :message=> "The Phone Number must contain at least 10 characters"
	validates_format_of :web_url, :with => URI::regexp(%w(http https))

def self.page_it (page_number)
	paginate( :page=> page_number, :per_page=> 1, :order=> :name)
end

def format_url
  self.web_url = "http://#{self.web_url}" unless self.web_url[/^https?/]    
end

acts_as_gmappable

def gmaps4rails_address
  address 
end	

has_attached_file :image

end
