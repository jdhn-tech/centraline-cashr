class CreateNoteEntries < ActiveRecord::Migration[5.1]
	def change
		create_table :note_entries do |t|
			t.references	:note,		null: false
			t.references	:article
			t.references	:menu
			t.text			:notice, array: true, default: []
			t.integer		:value
			t.string		:status
			t.timestamps
		end
	end
end
