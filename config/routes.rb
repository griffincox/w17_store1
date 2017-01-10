Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "addresses#index"
  # Routes for the Productitem resource:
  # CREATE
  get "/productitems/new", :controller => "productitems", :action => "new"
  post "/create_productitem", :controller => "productitems", :action => "create"

  # READ
  get "/productitems", :controller => "productitems", :action => "index"
  get "/productitems/:id", :controller => "productitems", :action => "show"

  # UPDATE
  get "/productitems/:id/edit", :controller => "productitems", :action => "edit"
  post "/update_productitem/:id", :controller => "productitems", :action => "update"

  # DELETE
  get "/delete_productitem/:id", :controller => "productitems", :action => "destroy"
  #------------------------------

  # Routes for the Order resource:
  # CREATE
  get "/orders/new", :controller => "orders", :action => "new"
  post "/create_order", :controller => "orders", :action => "create"

  # READ
  get "/orders", :controller => "orders", :action => "index"
  get "/orders/:id", :controller => "orders", :action => "show"

  # UPDATE
  get "/orders/:id/edit", :controller => "orders", :action => "edit"
  post "/update_order/:id", :controller => "orders", :action => "update"

  # DELETE
  get "/delete_order/:id", :controller => "orders", :action => "destroy"
  #------------------------------

  # Routes for the Itemphoto resource:
  # CREATE
  get "/itemphotos/new", :controller => "itemphotos", :action => "new"
  post "/create_itemphoto", :controller => "itemphotos", :action => "create"

  # READ
  get "/itemphotos", :controller => "itemphotos", :action => "index"
  get "/itemphotos/:id", :controller => "itemphotos", :action => "show"

  # UPDATE
  get "/itemphotos/:id/edit", :controller => "itemphotos", :action => "edit"
  post "/update_itemphoto/:id", :controller => "itemphotos", :action => "update"

  # DELETE
  get "/delete_itemphoto/:id", :controller => "itemphotos", :action => "destroy"
  #------------------------------

  # Routes for the Item resource:
  # CREATE
  get "/items/new", :controller => "items", :action => "new"
  post "/create_item", :controller => "items", :action => "create"

  # READ
  get "/items", :controller => "items", :action => "index"
  get "/items/:id", :controller => "items", :action => "show"

  # UPDATE
  get "/items/:id/edit", :controller => "items", :action => "edit"
  post "/update_item/:id", :controller => "items", :action => "update"

  # DELETE
  get "/delete_item/:id", :controller => "items", :action => "destroy"
  #------------------------------

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
