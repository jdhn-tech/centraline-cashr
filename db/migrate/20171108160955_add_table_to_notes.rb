class AddTableToNotes < ActiveRecord::Migration[5.1]
  def change
    add_reference :notes, :table, foreign_key: true
  end
end
