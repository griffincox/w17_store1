class OrdersController < ApplicationController
  def index
    @orders = Order.all

    render("orders/index.html.erb")
  end

  def show
    @order = Order.find(params[:id])

    render("orders/show.html.erb")
  end

  def new
    @order = Order.new

    render("orders/new.html.erb")
  end

  def create
    @order = Order.new

    @order.name = params[:name]
    @order.email = params[:email]
    @order.address = params[:address]
    @order.city = params[:city]
    @order.country = params[:country]
    @order.shipped = params[:shipped]

    save_status = @order.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/orders/new", "/create_order"
        redirect_to("/orders")
      else
        redirect_back(:fallback_location => "/", :notice => "Order created successfully.")
      end
    else
      render("orders/new.html.erb")
    end
  end

  def edit
    @order = Order.find(params[:id])

    render("orders/edit.html.erb")
  end

  def update
    @order = Order.find(params[:id])

    @order.name = params[:name]
    @order.email = params[:email]
    @order.address = params[:address]
    @order.city = params[:city]
    @order.country = params[:country]
    @order.shipped = params[:shipped]

    save_status = @order.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/orders/#{@order.id}/edit", "/update_order"
        redirect_to("/orders/#{@order.id}", :notice => "Order updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Order updated successfully.")
      end
    else
      render("orders/edit.html.erb")
    end
  end

  def destroy
    @order = Order.find(params[:id])

    @order.destroy

    if URI(request.referer).path == "/orders/#{@order.id}"
      redirect_to("/", :notice => "Order deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Order deleted.")
    end
  end
end
