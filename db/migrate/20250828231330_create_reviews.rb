class CreateReviews < ActiveRecord::Migration[8.0]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :item_id
      t.integer :srs_stage
      t.datetime :due_date
      t.integer :correct_answers
      t.integer :incorrect_answers
      t.integer :interval_minutes
      t.float :proficiency_rate

      t.timestamps
    end
  end
end
