class AddAboutToSpots < ActiveRecord::Migration[6.1]
  def change
    add_column :spots, :about, :string
  end
end
