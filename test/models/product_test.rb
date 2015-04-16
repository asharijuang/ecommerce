require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "product attributes must not be empty" do
  	product = Product.new
  	assert product.invalid?
  	assert product.errors[:title].any?
  	assert product.errors[:description].any?
  	assert product.errors[:image_url].any?
  	assert product.errors[:price].any?
  end

  test "product price must be positive" do
  	product = Product.new(
  		title: 'this is title',
  	 	description: 'this is description',
  	 	image_url: 'lorem.png'
  		)

  	product.price = -1
  	assert product.invalid?
  	assert_equal ["must be greater than or equal to 0.01"],
  	product.errors[:price]

  	product.price = 0
  	assert product.invalid?
  	assert_equal ["must be greater than or equal to 0.01"],
  	product.errors[:price]

  	product.price = 1
  	assert product.valid?
  end


  def new_product(image_url)
  	 product = Product.new(
  		title: 'this is title',
  	 	description: 'this is description',
  	 	image_url: image_url,
  	 	price: 1
  		)
  end

  test "image url" do
  	ok = %w{ ashari.gif juang.png juang.jpg septi.JPG SEPTI.Jpg 
  	http://asharijuang.com/logo.png }

  	bad = %w{ fred.doc fred.png/image fred.gif.more }

  	ok.each do |name|
  		assert new_product(name).valid?, "#{name} should be valid"
  	end

  	bad.each do |name|
  		assert new_product(name).invalid?, "#{name} shouldn't be valid"
  	end
  end

end
