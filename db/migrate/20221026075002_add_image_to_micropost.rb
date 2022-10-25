class AddImageToMicropost < ActiveRecord::Migration[7.0]
  def change
    add_column :microposts, :image, :string
  end
end
