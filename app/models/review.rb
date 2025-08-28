class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item, class_name: "Flashcard"
end
