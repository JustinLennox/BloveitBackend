class VenuesController < ApplicationController
  before_action :set_venue, only: [:show, :edit, :update, :destroy]

  # GET /venues
  # GET /venues.json
  def index
    @venues = Venue.where(nil)
    @venues = @venues.starts_with(params[:starts_with]) if params[:starts_with].present?
  end

  # GET /venues/1
  # GET /venues/1.json
  def show
  end

  # GET /venues/new
  def new
    @venue = Venue.new
  end

  # GET /venues/1/edit
  def edit
  end

  # POST /venues
  # POST /venues.json
  def create
    @venue = Venue.new(venue_params)
    @venue.blove_count = 0
    respond_to do |format|
      if @venue.save
        format.html { redirect_to @venue, notice: 'Venue was successfully created.' }
        format.json { render :show, status: :created, location: @venue }
      else
        format.html { render :new }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /venues/1
  # PATCH/PUT /venues/1.json
  def update
    respond_to do |format|
      if @venue.update(venue_params)
        format.html { redirect_to @venue, notice: 'Venue was successfully updated.' }
        format.json { render :show, status: :ok, location: @venue }
      else
        format.html { render :edit }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /venues/1
  # DELETE /venues/1.json
  def destroy
    @venue.destroy
    respond_to do |format|
      format.html { redirect_to venues_url, notice: 'Venue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venue
      @venue = Venue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def venue_params
      params.require(:venue).permit(:name, :price_rating, :neighborhood, :address, :blove_count, :date_type, :mood, 
        :polaroid_description, :specials, :food_drink, :why_blove_heading_1, :why_blove_heading_2, 
        :why_blove_heading_3, :why_blove_description_1, :why_blove_description_2,:why_blove_description_3, 
        :price_for_two,
         :monday_hours, :tuesday_hours, :wednesday_hours, :thursday_hours, :friday_hours, :saturday_hours, :sunday_hours,
        :crowd, :dress_code, :parking, :reservations, :atmosphere, :keep_in_mind,
        :polaroid_image, :thumbnail_image, :venue_image_1, :venue_image_2, :venue_image_3, :venue_image_4, :venue_image_5)
    end
end
