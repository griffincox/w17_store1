class ItemphotosController < ApplicationController
  def index
    @q = Itemphoto.ransack(params[:q])
    @itemphotos = @q.result(:distinct => true).includes(:item).page(params[:page]).per(10)

    render("itemphotos/index.html.erb")
  end

  def show
    @itemphoto = Itemphoto.find(params[:id])

    render("itemphotos/show.html.erb")
  end

  def new
    @itemphoto = Itemphoto.new

    render("itemphotos/new.html.erb")
  end

  def create
    @itemphoto = Itemphoto.new

    @itemphoto.item_id = params[:item_id]
    @itemphoto.image = params[:image]

    save_status = @itemphoto.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/itemphotos/new", "/create_itemphoto"
        redirect_to("/itemphotos")
      else
        redirect_back(:fallback_location => "/", :notice => "Itemphoto created successfully.")
      end
    else
      render("itemphotos/new.html.erb")
    end
  end

  def edit
    @itemphoto = Itemphoto.find(params[:id])

    render("itemphotos/edit.html.erb")
  end

  def update
    @itemphoto = Itemphoto.find(params[:id])

    @itemphoto.item_id = params[:item_id]
    @itemphoto.image = params[:image]

    save_status = @itemphoto.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/itemphotos/#{@itemphoto.id}/edit", "/update_itemphoto"
        redirect_to("/itemphotos/#{@itemphoto.id}", :notice => "Itemphoto updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Itemphoto updated successfully.")
      end
    else
      render("itemphotos/edit.html.erb")
    end
  end

  def destroy
    @itemphoto = Itemphoto.find(params[:id])

    @itemphoto.destroy

    if URI(request.referer).path == "/itemphotos/#{@itemphoto.id}"
      redirect_to("/", :notice => "Itemphoto deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Itemphoto deleted.")
    end
  end
end
