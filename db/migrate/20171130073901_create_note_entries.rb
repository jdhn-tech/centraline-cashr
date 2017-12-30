class CreateNoteEntries < ActiveRecord::Migration[5.1]
	def change
		create_table :note_entries do |t|
			t.references	:note,		null: false
			t.references	:article	null: true
			t.references	:menu		null: true
			t.text			:notices, array: true, default: []
			t.integer		:value
			t.string		:status
			t.timestamps
		end
	end
end
