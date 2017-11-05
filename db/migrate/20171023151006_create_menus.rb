class CreateMenus < ActiveRecord::Migration[5.1]
	def change
		create_table :menus do |t|
			t.string :code
			t.string :name
			t.integer :price
			t.references :category
			t.text :article_ids, array: true, default: []
			t.timestamps
		end
	end
end
