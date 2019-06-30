class AddBiotoContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :biography, :text
  end
end
