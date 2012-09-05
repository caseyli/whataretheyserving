class LocationsController < ApplicationController
  
  before_filter :load_company
  
  # GET /locations
  # GET /locations.json
  def index
    @locations = @company.locations

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @locations }
    end
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @location = @company.locations.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location }
    end
  end

  # GET /locations/new
  # GET /locations/new.json
  def new
    @location = @company.locations.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location }
    end
  end

  # GET /locations/1/edit
  def edit
    @location = @company.locations.find(params[:id])
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = @company.locations.build(params[:location])

    respond_to do |format|
      if @location.save
        format.html { redirect_to company_locations_path(@company), notice: 'Location was successfully created.' }
        format.json { render json: @location, status: :created, location: @location }
      else
        format.html { render action: "new" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /locations/1
  # PUT /locations/1.json
  def update
    @location = @company.locations.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        format.html { redirect_to @company, notice: 'Location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location = @company.locations.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to company_locations_path(@company) }
      format.json { head :no_content }
    end
  end
  
  private
    def load_company
      @company = Company.find(params[:company_id])
    end
  
end
