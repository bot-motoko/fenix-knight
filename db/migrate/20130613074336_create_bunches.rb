class CreateBunches < ActiveRecord::Migration
  def change
    create_table :bunches do |t|
      t.text :landing

      t.timestamps
    end
  end
end
