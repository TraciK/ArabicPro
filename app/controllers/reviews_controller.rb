class ReviewsController < ApplicationController
  def index
    matching_reviews = Review.all

    @list_of_reviews = matching_reviews.order({ :created_at => :desc })

    render({ :template => "review_templates/index" })
  end

  def show
    @card = Flashcard.where("due_date <= ?", Time.now).first
  end

  def update
    @card = Flashcard.find(params[:id])

        if reviews.correct_answers <== reviews.incorrect_answers
      pp #{
        the_flashcard.word
        the_flashcard.audio
        the_flashcard.transliteration
        the_flashcard.translation
        the_flashcard.mnemonic
        the_flashcard.sentence
        the_flashcard.sentence_translation
        the_flashcard.part_of_speech
        }
    else
      pp #{
        the_flashcard.word
        the_flashcard.audio
        the_flashcard.transliteration
        }
      end

    if params[:result] == "correct"
      @card.interval = (@card.interval * 2).round
      @card.due_date = Time.now + @card.interval.days
    else
      @card.interval = 1
      @card.due_date = Time.now + 1.day
    end

     if the_review.valid?
      the_review.save
      redirect_to("/reviews", { :notice => "Review created successfully." })
    else
      redirect_to("/reviews", { :alert => the_review.errors.full_messages.to_sentence })
    end
  end
end


# class ReviewsController < ApplicationController


#   def create
#     the_review = Review.new
#     the_review.user_id = params.fetch("query_user_id")
#     the_review.item_id = params.fetch("query_item_id")
#     the_review.srs_stage = params.fetch("query_srs_stage")
#     the_review.due_date = params.fetch("query_due_date")
#     the_review.correct_answers = params.fetch("query_correct_answers")
#     the_review.incorrect_answers = params.fetch("query_incorrect_answers")
#     the_review.interval_minutes = params.fetch("query_interval_minutes")
#     the_review.proficiency_rate = params.fetch("query_proficiency_rate")

#     if the_review.valid?
#       the_review.save
#       redirect_to("/reviews", { :notice => "Review created successfully." })
#     else
#       redirect_to("/reviews", { :alert => the_review.errors.full_messages.to_sentence })
#     end
#   end

#   def update
#     the_id = params.fetch("path_id")
#     the_review = Review.where({ :id => the_id }).at(0)

#     the_review.user_id = params.fetch("query_user_id")
#     the_review.item_id = params.fetch("query_item_id")
#     the_review.srs_stage = params.fetch("query_srs_stage")
#     the_review.due_date = params.fetch("query_due_date")
#     the_review.correct_answers = params.fetch("query_correct_answers")
#     the_review.incorrect_answers = params.fetch("query_incorrect_answers")
#     the_review.interval_minutes = params.fetch("query_interval_minutes")
#     the_review.proficiency_rate = params.fetch("query_proficiency_rate")

#     if the_review.valid?
#       the_review.save
#       redirect_to("/reviews/#{the_review.id}", { :notice => "Review updated successfully." } )
#     else
#       redirect_to("/reviews/#{the_review.id}", { :alert => the_review.errors.full_messages.to_sentence })
#     end
#   end

#   def destroy
#     the_id = params.fetch("path_id")
#     the_review = Review.where({ :id => the_id }).at(0)

#     the_review.destroy

#     redirect_to("/reviews", { :notice => "Review deleted successfully." } )
#   end
# end
