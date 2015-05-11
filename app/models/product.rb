class Product < ActiveRecord::Base
	# validation require title,description, and image field
	validates :title, :description, :image_url, presence: true
	# validation input price only number
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	# title must uniq or not equal to each other 
	validates :title, uniqueness: true
	# validation for image type
	validates :image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)\Z}i,
		message: 'must be a url for GIF, JPG, or PNG image'
	}

end
