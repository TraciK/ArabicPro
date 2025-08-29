# == Schema Information
#
# Table name: reviews
#
#  id                :bigint           not null, primary key
#  correct_answers   :integer
#  due_date          :datetime
#  incorrect_answers :integer
#  interval          :integer
#  proficiency_rate  :float
#  srs_stage         :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  item_id           :integer
#  user_id           :integer
#
class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item, class_name: "Flashcard"
end
