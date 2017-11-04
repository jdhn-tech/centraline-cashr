class CreateArticles < ActiveRecord::Migration[5.1]
	def change
		create_table :articles do |t|
			t.string :code
			t.string :name
			t.string :portion
			t.integer :price
			t.text :category_ids, array: true, default: []
			t.timestamps
		end
	end
end
