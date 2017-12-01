class CreateCategories < ActiveRecord::Migration[5.1]
	def change
		create_table :categories do |t|
			t.string :code
			t.string :name
			t.float :vat
			t.timestamps
		end
	end
end
