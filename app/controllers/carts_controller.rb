class CartsController < ApplicationController
  def index
    @carts = Cart.all

    render("carts/index.html.erb")
  end

  def show
    @cart = Cart.find(params[:id])

    render("carts/show.html.erb")
  end

  def new
    @cart = Cart.new

    render("carts/new.html.erb")
  end

  def create
    @cart = Cart.new

    @cart.user_id = params[:user_id]

    save_status = @cart.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/carts/new", "/create_cart"
        redirect_to("/carts")
      else
        redirect_back(:fallback_location => "/", :notice => "Cart created successfully.")
      end
    else
      render("carts/new.html.erb")
    end
  end

  def edit
    @cart = Cart.find(params[:id])

    render("carts/edit.html.erb")
  end

  def update
    @cart = Cart.find(params[:id])

    @cart.user_id = params[:user_id]

    save_status = @cart.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/carts/#{@cart.id}/edit", "/update_cart"
        redirect_to("/carts/#{@cart.id}", :notice => "Cart updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Cart updated successfully.")
      end
    else
      render("carts/edit.html.erb")
    end
  end

  def destroy
    @cart = Cart.find(params[:id])

    @cart.destroy

    if URI(request.referer).path == "/carts/#{@cart.id}"
      redirect_to("/", :notice => "Cart deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Cart deleted.")
    end
  end
end
