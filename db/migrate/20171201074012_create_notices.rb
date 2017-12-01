class CreateNotices < ActiveRecord::Migration[5.1]
	def change
		create_table :notices do |t|
			t.string		:image
			t.string		:description
			t.timestamps
		end
	end
end
