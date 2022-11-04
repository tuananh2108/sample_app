class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name

      t.timestamps
    end
    add_index :groups, :name, :unique => true
  end
end
