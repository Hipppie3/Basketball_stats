class RemoveSportAndAddReferenceToPlayers < ActiveRecord::Migration[7.0]
  def change
    # Remove the "sport" column
    remove_column :players, :sport, :string

    # Add the "sport" reference
    add_reference :players, :sport, foreign_key: true
  end
end
