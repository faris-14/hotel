class ChangeCols < ActiveRecord::Migration
  def change
      add_column :customers, :name, :text
      Customer.update_all("name = fname || ' ' || lname")
      remove_column :customers, :ssn
      remove_column :customers, :fname
      remove_column :customers, :lname
  end
end
