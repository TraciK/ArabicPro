class MainController < ApplicationController
  def homepage
    render({ :template => "main_templates/homepage"})
  end

  def about
    render({ :template => "main_templates/about"})
  end
end
