class ChangeTypeToText < ActiveRecord::Migration
  def change
   change_column :entries, :identifier, :text
   change_column :entries, :permalink, :text
   change_column :entries, :imagelink, :text
  end
end
