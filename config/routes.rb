Rails.application.routes.draw do
  # Routes for the Cart resource:
  # CREATE
  get "/carts/new", :controller => "carts", :action => "new"
  post "/create_cart", :controller => "carts", :action => "create"

  # READ
  get "/carts", :controller => "carts", :action => "index"
  get "/carts/:id", :controller => "carts", :action => "show"

  # UPDATE
  get "/carts/:id/edit", :controller => "carts", :action => "edit"
  post "/update_cart/:id", :controller => "carts", :action => "update"

  # DELETE
  get "/delete_cart/:id", :controller => "carts", :action => "destroy"
  #------------------------------

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
