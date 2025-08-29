class RenameIntervalMinutesToInterval < ActiveRecord::Migration[8.0]
  def change
    rename_column :reviews, :interval_minutes, :interval
  end
end
