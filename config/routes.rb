Rails.application.routes.draw do
  devise_for :users
  # Routes for the Flashcard resource:
  # get("/", { :controller => "main", :action => "homepage" })

  root to: "boards#index"
  get("/about", { :controller => "main", :action => "about" })


  # READ
  get("/flashcards", { :controller => "flashcards", :action => "index" })

  get("/flashcards/:path_id", { :controller => "flashcards", :action => "show" })

  #------------------------------

  # Routes for the Review resource:

  # READ
  get("/reviews", { :controller => "reviews", :action => "index" })

  get("/reviews/:path_id", { :controller => "reviews", :action => "show" })

  # UPDATE

  put("/reviews/:path_id", { :controller => "reviews", :action => "update" })

  #------------------------------


end
