class AddClientTable < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
        t.string :first_name
        t.string :last_name
        t.string :address
        t.integer :postal_code
        t.integer :city
        t.string :email
        t.string :phone
        t.datetime :last_visit
    end
  end
end
