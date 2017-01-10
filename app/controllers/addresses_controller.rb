class AddressesController < ApplicationController
  def index
    @addresses = Address.all

    render("addresses/index.html.erb")
  end

  def show
    @address = Address.find(params[:id])

    render("addresses/show.html.erb")
  end

  def new
    @address = Address.new

    render("addresses/new.html.erb")
  end

  def create
    @address = Address.new

    @address.user_id = params[:user_id]
    @address.address_type = params[:address_type]
    @address.street_address1 = params[:street_address1]
    @address.unit_number = params[:unit_number]
    @address.street_address2 = params[:street_address2]
    @address.city = params[:city]
    @address.state = params[:state]
    @address.country = params[:country]
    @address.zip = params[:zip]

    save_status = @address.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/addresses/new", "/create_address"
        redirect_to("/addresses")
      else
        redirect_back(:fallback_location => "/", :notice => "Address created successfully.")
      end
    else
      render("addresses/new.html.erb")
    end
  end

  def edit
    @address = Address.find(params[:id])

    render("addresses/edit.html.erb")
  end

  def update
    @address = Address.find(params[:id])

    @address.user_id = params[:user_id]
    @address.address_type = params[:address_type]
    @address.street_address1 = params[:street_address1]
    @address.unit_number = params[:unit_number]
    @address.street_address2 = params[:street_address2]
    @address.city = params[:city]
    @address.state = params[:state]
    @address.country = params[:country]
    @address.zip = params[:zip]

    save_status = @address.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/addresses/#{@address.id}/edit", "/update_address"
        redirect_to("/addresses/#{@address.id}", :notice => "Address updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Address updated successfully.")
      end
    else
      render("addresses/edit.html.erb")
    end
  end

  def destroy
    @address = Address.find(params[:id])

    @address.destroy

    if URI(request.referer).path == "/addresses/#{@address.id}"
      redirect_to("/", :notice => "Address deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Address deleted.")
    end
  end
end
