class CreateMenuTable < ActiveRecord::Migration[5.1]
	def change
		create_table :menus do |t|
			t.string :code
			t.string :name
			t.integer :price
		end
	end
end
