class AddManaToSpots < ActiveRecord::Migration[6.1]
  def change
    add_column :spots, :Mana, :string
  end
end
