class AddToToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :to, :string
  end
end
