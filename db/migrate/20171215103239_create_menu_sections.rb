class CreateMenuSections < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_sections do |t|
    	t.string :name
    end
  end
end
