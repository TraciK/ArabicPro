class Flashcard < ApplicationRecord
  has_many  :user_items, class_name: "Review", foreign_key: "item_id", dependent: :destroy
end
