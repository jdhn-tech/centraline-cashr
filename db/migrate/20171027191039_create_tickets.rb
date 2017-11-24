class CreateTickets < ActiveRecord::Migration[5.1]
	def change
		create_table :tickets do |t|
			t.integer :value
			t.string :currency
			t.references :note
			t.boolean :paid
			t.text :article_ids, array: true, default: []
			t.text :menu_ids, array: true, default: []
			t.timestamps
		end
	end
end
