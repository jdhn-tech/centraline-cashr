class CreateArticles < ActiveRecord::Migration[5.1]
	def change
		create_table :articles do |t|
			t.string :code
			t.string :name
			t.string :portion
			t.integer :price
			t.timestamps
		end
	end
end
