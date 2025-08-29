Rails.application.routes.draw do
  # Routes for the Flashcard resource:
  get("/", { :controller => "main", :action => "homepage" })
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

  devise_for :users
  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:
  # get("/your_first_screen", { :controller => "pages", :action => "first" })
end
