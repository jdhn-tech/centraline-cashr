class CreateSeats < ActiveRecord::Migration[5.1]
  def change
    create_table :seats do |t|

      t.timestamps
    end
  end
end
