class AddCountToUrls < ActiveRecord::Migration
	def change
		add_column :urls, :count_click, :integer, default: 0 # table name,column name & data type of column 
	end
end
