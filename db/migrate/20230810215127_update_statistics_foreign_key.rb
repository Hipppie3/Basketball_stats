class UpdateStatisticsForeignKey < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :statistics, :games
    add_foreign_key :statistics, :games, on_delete: :cascade
  end
end
