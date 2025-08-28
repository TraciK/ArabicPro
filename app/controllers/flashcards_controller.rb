class FlashcardsController < ApplicationController
  def index
    matching_flashcards = Flashcard.all

    @list_of_flashcards = matching_flashcards.order({ :created_at => :desc })

    render({ :template => "flashcard_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_flashcards = Flashcard.where({ :id => the_id })

    @the_flashcard = matching_flashcards.at(0)

    render({ :template => "flashcard_templates/show" })
  end

  def update
    the_id = params.fetch("path_id")
    the_flashcard = Flashcard.where({ :id => the_id }).at(0)

    the_flashcard.word = params.fetch("query_word")
    the_flashcard.audio = params.fetch("query_audio")
    the_flashcard.transliteration = params.fetch("query_transliteration")
    the_flashcard.translation = params.fetch("query_translation")
    the_flashcard.mnemonic = params.fetch("query_mnemonic")
    the_flashcard.sentence = params.fetch("query_sentence")
    the_flashcard.sentence_translation = params.fetch("query_sentence_translation")
    the_flashcard.part_of_speech = params.fetch("query_part_of_speech")

    if the_flashcard.valid?
      the_flashcard.save
      redirect_to("/flashcards/#{the_flashcard.id}", { :notice => "Flashcard updated successfully." } )
    else
      redirect_to("/flashcards/#{the_flashcard.id}", { :alert => the_flashcard.errors.full_messages.to_sentence })
    end
  end
end
