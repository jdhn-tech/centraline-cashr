class CreateMenuArticleAssociation < ActiveRecord::Migration[5.1]
	def change
		create_table :menu_article_associations do |t|
			t.references :menu
			t.references :article
			t.references :menu_section
			t.boolean :choosable
		end
	end
end
