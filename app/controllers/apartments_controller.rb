class ApartmentsController < ApplicationController

  # GET: /apartments
  get "/apartments" do
    @apartments = Apartment.order(number: :asc)
    erb :"/apartments/index.html"
  end

  get "/printer_friendly_index_apartment" do
    # @apartments = Apartment.order(number: :asc)
    @permits = Permit.joins(:apartment).merge(Apartment.order(number: :asc))
    erb :"/apartments/printer_friendly_index_apartment.html", :layout => :empty_layout
  end

  # GET: /apartments/new
  get "/apartments/new" do
    erb :"/apartments/new.html"
  end

  get "/apartments/search" do
    erb :"/apartments/search.html"
  end

  # POST: /apartments
  post "/apartments" do
    if params[:building] != "" && params[:unit] != ""
      @bld = params[:building].upcase
      @uni = params[:unit].upcase
      @num = @bld + @uni
    else
      redirect to "/apartments/new"
    end
    # check if paramms = "" | turn 'em capitolized | make my :NUMBER for the attribute

    @apartment = Apartment.find_by(number: @num)
    # see if the apartment already exists in the database

    if @apartment != nil
      redirect to "/apartments/#{@apartment.id}"
    else
      @apartment = Apartment.create(building: @bld, unit: @uni, number: @num)
      redirect to "/apartments/#{@apartment.id}"
    end
      
  end

  # GET: /apartments/5
  get "/apartments/:id" do
    
    @apartment = Apartment.find(params[:id])
    
    @ps = Permit.where(apartment_id: @apartment.id)

    # if @permits_array is not an empty array
    #   iterate through array 
    #   for each permit
    #      display on show page
    # end

    erb :"/apartments/show.html"
  end

  # GET: /apartments/5/edit
  get "/apartments/:id/edit" do
    @apartment = Apartment.find(params[:id])
    erb :"/apartments/edit.html"
  end

  # PATCH: /apartments/5
  patch "/apartments/:id" do
    @apartment = Apartment.find(params[:id])
    @apartment.update(building: params[:building].upcase, 
                      unit: params[:unit].upcase,
                      number: params[:building].upcase + params[:unit].upcase)
    redirect "/apartments/#{@apartment.id}"
  end

  # DELETE: /apartments/5/delete
  delete "/apartments/:id/delete" do
    @apartment = Apartment.find(params[:id])
    @apartment.destroy
    redirect "/apartments"
  end
end
