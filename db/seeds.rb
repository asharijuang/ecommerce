Product.delete_all
# Create one product data
Product.create!(
	title: 'DVD Tutorial Programing',
	description: %{<p>This is awesome product, learning programing with fun<p>},
	image_url: 'default.png',
	price: 10.25
)