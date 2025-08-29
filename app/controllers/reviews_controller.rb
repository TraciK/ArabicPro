class ReviewsController < ApplicationController
  def index
    matching_reviews = Review.all

    @list_of_reviews = matching_reviews.order({ :created_at => :desc })

   @due_reviews = Review.where("due_date <= ?", Time.now)

  # Decide what to display
  if @due_reviews.empty?
    @no_reviews_due = true
  else
    @review = @due_reviews.first
    @card = @review.item
  end

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
    @correct_answers = @review.correct_answers
    @incorrect_answers = @review.incorrect_answers

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
      @review.interval ||= 1       # set to 1 if nil
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
