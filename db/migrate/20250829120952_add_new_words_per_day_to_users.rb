class AddNewWordsPerDayToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :new_words_per_day, :integer, default: 10
  end
end
