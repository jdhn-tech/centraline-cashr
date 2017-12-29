class CreateMenuArticles < ActiveRecord::Migration[5.1]
	def change
		create_table :menu_articles do |t|
			t.references :menu
			t.references :article
			t.references :menu_section
			t.boolean :choosable
			t.timestamps
		end
	end
end
