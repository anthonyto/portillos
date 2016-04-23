class ChangeFromAndToInMessages < ActiveRecord::Migration
  def change
    rename_column :messages, :from, :from_number
    rename_column :messages, :to, :to_number
  end
end
