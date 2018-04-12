class AddModeToNote < ActiveRecord::Migration[5.1]
  def change
  	add_column :notes, :mode, :string
  end
end
