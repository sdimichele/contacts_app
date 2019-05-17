class AddMiddleToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :middle, :string
  end
end
