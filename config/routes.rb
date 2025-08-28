Rails.application.routes.draw do
  # Routes for the Flashcard resource:

  # CREATE
  post("/insert_flashcard", { :controller => "flashcards", :action => "create" })

  # READ
  get("/flashcards", { :controller => "flashcards", :action => "index" })

  get("/flashcards/:path_id", { :controller => "flashcards", :action => "show" })

  # UPDATE

  post("/modify_flashcard/:path_id", { :controller => "flashcards", :action => "update" })

  # DELETE
  get("/delete_flashcard/:path_id", { :controller => "flashcards", :action => "destroy" })

  #------------------------------

  # Routes for the Review resource:

  # CREATE
  post("/insert_review", { :controller => "reviews", :action => "create" })

  # READ
  get("/reviews", { :controller => "reviews", :action => "index" })

  get("/reviews/:path_id", { :controller => "reviews", :action => "show" })

  # UPDATE

  post("/modify_review/:path_id", { :controller => "reviews", :action => "update" })

  # DELETE
  get("/delete_review/:path_id", { :controller => "reviews", :action => "destroy" })

  #------------------------------

  devise_for :users
  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:
  # get("/your_first_screen", { :controller => "pages", :action => "first" })
end
