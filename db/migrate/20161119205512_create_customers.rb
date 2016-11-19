class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :ssn
      t.text :fname
      t.text :lname
      t.text :email
      t.text :password

      t.timestamps null: false
    end
  end
end
