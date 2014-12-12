class AddIconToPuzzles < ActiveRecord::Migration
  def change
    add_column :puzzles, :icon, :string
  end
end
