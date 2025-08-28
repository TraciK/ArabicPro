class CreateFlashcards < ActiveRecord::Migration[8.0]
  def change
    create_table :flashcards do |t|
      t.string :word
      t.text :audio
      t.string :transliteration
      t.string :translation
      t.string :mnemonic
      t.string :sentence
      t.string :sentence_translation
      t.string :part_of_speech

      t.timestamps
    end
  end
end
