class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :identifier
      t.references :provider, index: true
      t.index [:identifier, :provider_id], unique: true, name: 'identifier_index'
      t.string :permalink
      t.string :imagelink

      t.timestamps
    end
  end
end
