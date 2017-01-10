Rails.application.routes.draw do
  # Routes for the Address resource:
  # CREATE
  get "/addresses/new", :controller => "addresses", :action => "new"
  post "/create_address", :controller => "addresses", :action => "create"

  # READ
  get "/addresses", :controller => "addresses", :action => "index"
  get "/addresses/:id", :controller => "addresses", :action => "show"

  # UPDATE
  get "/addresses/:id/edit", :controller => "addresses", :action => "edit"
  post "/update_address/:id", :controller => "addresses", :action => "update"

  # DELETE
  get "/delete_address/:id", :controller => "addresses", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
