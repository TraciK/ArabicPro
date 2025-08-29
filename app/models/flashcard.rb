# == Schema Information
#
# Table name: flashcards
#
#  id                   :bigint           not null, primary key
#  audio                :text
#  mnemonic             :string
#  part_of_speech       :string
#  sentence             :string
#  sentence_translation :string
#  translation          :string
#  transliteration      :string
#  word                 :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class Flashcard < ApplicationRecord
  has_many :user_items, class_name: "Review", foreign_key: "item_id", dependent: :destroy
end
