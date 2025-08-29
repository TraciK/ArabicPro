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
end
