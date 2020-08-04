class PermitsController < ApplicationController

  # GET: /permits
  get "/permits" do
    @permits = Permit.all
    erb :"/permits/index.html"
  end

  # GET: /permits/new
  get "/permits/new" do
    erb :"/permits/new.html"
  end

  # POST: /permits
  post "/permits" do
    @apartment = Apartment.find_or_create_by(building: params[:building].upcase, unit: params[:unit].upcase, number: params[:building].upcase + params[:unit].upcase)
    @permit = Permit.create(apartment_id: @apartment.id)
    params.except(:building, :unit).each do |key, value|
      @permit.send("#{key}=", value)
    end
    @permit.save
    redirect "/permits"
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
      tenant_name: params[:tenant_name], 
      contact_number: params[:contact_number], 
      vehicle_plate: params[:vehicle_plate], 
      vehicle_color: params[:vehicle_color], 
      vehicle_year: params[:vehicle_year], 
      vehicle_make_model: params[:vehicle_make_model] 
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
