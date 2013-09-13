class EntriesController < ApplicationController
  
  before_filter :load_company_and_location
  
  # GET /entries
  # GET /entries.json
  def index
    @entries = @location.entries.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @entries }
    end
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
    @entry = @location.entries.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @entry }
    end
  end

  # GET /entries/new
  # GET /entries/new.json
  def new
    @entry = @location.entries.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @entry }
    end
  end

  # GET /entries/1/edit
  def edit
    @entry = @location.entries.find(params[:id])
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = @location.entries.build(params[:entry])

    respond_to do |format|
      if @entry.save
        format.html { redirect_to company_location_path(@company, @location), notice: 'Entry was successfully created.' }
        format.json { render json: @entry, status: :created, location: @entry }
      else
        format.html { render action: "new" }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /entries/1
  # PUT /entries/1.json
  def update
    @entry = @location.entries.find(params[:id])

    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry = @location.entries.find(params[:id])
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to company_location_path(@company, @location) }
      format.json { head :no_content }
    end
  end

	def increment_upvotes
		@entry = @location.entries.find(params[:id])
		if @entry.upvotes.nil?
			@entry.upvotes = 1
		else
			@entry.upvotes += 1
		end
		@success = @entry.save
		
		respond_to do |format|
			format.json { render :json => { success: @success, value: @entry.upvotes }.to_json}
		end
	end
	
	def increment_downvotes
		@entry = @location.entries.find(params[:id])
		if @entry.downvotes.nil?
			@entry.downvotes = 1
		else
			@entry.downvotes += 1
		end
		@success = @entry.save
		
		respond_to do |format|
			format.json { render :json => { success: @success, value: @entry.downvotes }.to_json}
		end
	end
	
	def increment_soldoutvotes
		@entry = @location.entries.find(params[:id])
		if @entry.soldoutvotes.nil?
			@entry.soldoutvotes = 1
		else
			@entry.soldoutvotes += 1
		end
		@success = @entry.save
		
		respond_to do |format|
			format.json { render :json => { success: @success, value: @entry.soldoutvotes }.to_json}
		end
	end
  
  private
    def load_company_and_location
      @company = Company.find(params[:company_id])
      @location = @company.locations.find(params[:location_id])
    end
end
