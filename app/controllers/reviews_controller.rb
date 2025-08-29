class ReviewsController < ApplicationController
  def index
    matching_reviews = Review.all

    @list_of_reviews = matching_reviews.order({ :created_at => :desc })

    render({ :template => "review_templates/index" })
  end

  def show
   @review = Review
      .where("reviews.due_date <= ?", Time.now)
      .first

  @card = @review.item if @review

   @reveal_answer = params[:reveal].present?

    render({ :template => "review_templates/show" })
  end

  def update
    @card = Flashcard.find(params[:id])

    @review = Review.find(params[:id])
    @correct_answers = Review.correct_answers
    @incorrect_answers = Review.incorrect_answers

        if @correct_answers <= @incorrect_answers
      puts [
        @card.word,
        @card.audio,
        @card.transliteration,
        @card.translation,
        @card.mnemonic,
        @card.sentence,
        @card.sentence_translation,
        @card.part_of_speech,
      ]
    else
      puts [
        @card.word,
        @card.audio,
        @card.transliteration,
       ]
      end

    if params[:result] == "correct"
      @review.interval = (@review.interval * 2).round
      @review.due_date = Time.now + @review.interval.days
    else
      @review.interval = 1
      @review.due_date = Time.now + 1.day
    end

     if @review.valid?
      @review.save
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
