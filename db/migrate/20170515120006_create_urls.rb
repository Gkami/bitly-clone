class CreateUrls < ActiveRecord::Migration[5.0]
	def change
		create_table :urls do |x|
			x.string  :long_url
			x.string  :short_url
			x.timestamps
		end
	end
end
