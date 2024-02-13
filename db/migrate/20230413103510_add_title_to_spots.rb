class AddTitleToSpots < ActiveRecord::Migration[6.1]
  def change
    add_column :spots, :title, :string
  end
end
