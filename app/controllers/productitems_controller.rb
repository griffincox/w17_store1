class ProductitemsController < ApplicationController
  def index
    @q = Productitem.ransack(params[:q])
    @productitems = @q.result(:distinct => true).includes(:cart, :item, :order).page(params[:page]).per(10)

    render("productitems/index.html.erb")
  end

  def show
    @productitem = Productitem.find(params[:id])

    render("productitems/show.html.erb")
  end

  def new
    @productitem = Productitem.new

    render("productitems/new.html.erb")
  end

  def create
    @productitem = Productitem.new

    @productitem.cart_id = params[:cart_id]
    @productitem.order_id = params[:order_id]
    @productitem.item_id = params[:item_id]

    save_status = @productitem.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/productitems/new", "/create_productitem"
        redirect_to("/productitems")
      else
        redirect_back(:fallback_location => "/", :notice => "Productitem created successfully.")
      end
    else
      render("productitems/new.html.erb")
    end
  end

  def edit
    @productitem = Productitem.find(params[:id])

    render("productitems/edit.html.erb")
  end

  def update
    @productitem = Productitem.find(params[:id])

    @productitem.cart_id = params[:cart_id]
    @productitem.order_id = params[:order_id]
    @productitem.item_id = params[:item_id]

    save_status = @productitem.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/productitems/#{@productitem.id}/edit", "/update_productitem"
        redirect_to("/productitems/#{@productitem.id}", :notice => "Productitem updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Productitem updated successfully.")
      end
    else
      render("productitems/edit.html.erb")
    end
  end

  def destroy
    @productitem = Productitem.find(params[:id])

    @productitem.destroy

    if URI(request.referer).path == "/productitems/#{@productitem.id}"
      redirect_to("/", :notice => "Productitem deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Productitem deleted.")
    end
  end
end
