class AddLinkToSpots < ActiveRecord::Migration[6.1]
  def change
    add_column :spots, :link, :string
  end
end
