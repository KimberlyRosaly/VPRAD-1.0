class PermitsController < ApplicationController

  # GET: /permits
  get "/permits" do    
    @permits = Permit.order(number: :asc)
    erb :"/permits/index.html"
  end

  get "/printer_friendly_index" do
    @permits = Permit.order(number: :asc)
    erb :"/permits/printer_friendly_index.html", :layout => :empty_layout
  end

  get "/printer_friendly_index_plate" do
    @permits = Permit.order(vehicle_plate: :asc)
    erb :"/permits/printer_friendly_index_plate.html", :layout => :empty_layout
  end

  get "/permits_by_plate" do
    @permits = Permit.order(vehicle_plate: :asc)
    erb :"/permits/index_plate.html"
  end

  # GET: /permits/new
  get "/permits/new" do
    erb :"/permits/new.html"
  end

  get "/permits/search" do
    erb :"/permits/search.html"
  end

  post "/permits/lookup" do
    # if permit number can be found
    if @permit = Permit.find_by(number: params[:number])
    #   return mathing permit/id
      redirect to "/permits/#{@permit.id}"
    else
      redirect to "/permits/search"
    end
  end

  # POST: /permits
  post "/permits" do
    @apartment = Apartment.find_or_create_by(building: params[:building].upcase, unit: params[:unit].upcase, number: params[:building].upcase + params[:unit].upcase)
    @permit = Permit.create(apartment_id: @apartment.id)

    
    params.except(:building, :unit, :contact_number).each do |key, value|
      @permit.send("#{key}=", value.upcase)

        if params[:contact_number].length == 10
          params[:contact_number].insert(0,"(").insert(4, ")").insert(8,"-")
        else
          @permit.contact_number = params[:contact_number]
        end

    end

    @permit.save
    redirect "/apartments/#{@apartment.id}"
  end

  # GET: /permits/5
  get "/permits/:id" do
    @permit = Permit.find(params[:id])
    @apartment = Apartment.find(@permit[:apartment_id])
    erb :"/permits/show.html"
  end

  # GET: /permits/5/edit
  get "/permits/:id/edit" do
    @permit = Permit.find(params[:id])
    @apartment = Apartment.find(@permit.apartment_id)
    erb :"/permits/edit.html"
  end

  # PATCH: /permits/5
  patch "/permits/:id" do
    @apartment = Apartment.find_by(building: params[:building], unit: params[:unit])
    if @apartment == nil
      @apartment = Apartment.create(building: params[:building].upcase, unit: params[:unit].upcase, number: params[:building].upcase + params[:unit].upcase)
    end
    @permit = Permit.find(params[:id])
    @permit.update(
      apartment_id: @apartment.id, 
      number: params[:number], 
      tenant_name: params[:tenant_name].upcase, 
      contact_number: params[:contact_number], 
      vehicle_plate: params[:vehicle_plate].upcase, 
      vehicle_color: params[:vehicle_color].upcase, 
      vehicle_year: params[:vehicle_year], 
      vehicle_make_model: params[:vehicle_make_model].upcase 
    )
    redirect "/permits/#{@permit.id}"
  end

  # DELETE: /permits/5/delete
  delete "/permits/:id/delete" do
    @permit = Permit.find(params[:id])
    @permit.destroy
    redirect "/permits"
  end
end
