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

  #THIS IS WHERE OUR ALGORITHM GOES
  # GET /venues/polaroid/all
  # GET /venues/polaroid/all.json
  def polaroid
    if params[:neighborhood].blank? || params[:user_fbAccessToken].blank?
      @venues = Venue.all.limit(5)
    else
      neighborhood_array = params[:neighborhood].split('Q')
      puts "Neigh array: ", neighborhood_array
      @venues = Venue.where(neighborhood: neighborhood_array)

      if(params[:coffee] == "YES" || params[:drinks] == "YES" || params[:mood].blank? || params[:mood] == "Not-Picky")
        puts "Not Picky"
      else
        @venues = @venues.where(mood: params[:mood])
      end
      @venues = @venues.where(dinner: params[:dinner]) unless params[:dinner].blank?
      @venues = @venues.where(dessert: params[:dessert]) unless params[:dessert].blank?
      @venues = @venues.where(drinks: params[:drinks]) unless params[:drinks].blank?
      @venues = @venues.where(coffee: params[:coffee]) unless params[:coffee].blank?
      if(@venues.size < 5)
        @venues = Venue.all.limit(5)
        return
      end
      user = User.find_by(fbAccessToken: params[:user_fbAccessToken]) unless params[:user_fbAccessToken].blank?
      venueHash = Hash.new
      score_sum = 0
      @venues.each{
        |v|
        puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
        puts v.name
        score = 100
        unless user.nil? || user.blank?
          unless user.favorites.nil?
            if user.favorites.include? v.id.to_s
              puts "THIS VENUE IS A FAVORITE"
              score *= 0.2
            elsif !user.favorites.include? v.id.to_s
              puts "THIS VENUE NOT A FAVORITE"
              score *= 1.5
            end
          end
          unless user.bloved_venues.nil?
              if user.bloved_venues.include? v.id.to_s
                puts "THE USER BLOVED THIS VENUE"
                score *= 0.5
              end
          end
        end
        if params[:date_day].include?("Sun") && v.sunday_special.length > 1
          score *= 2
        elsif params[:date_day].include?("Mon") && v.monday_special.length > 1
          score *= 2
        elsif params[:date_day].include?("Tue") && v.tuesday_special.length > 1
          score *= 2
        elsif params[:date_day].include?("Wed") && v.wednesday_special.length > 1
          score *= 2
        elsif params[:date_day].include?("Thu") && v.thursday_special.length > 1
          puts "SPECIAL"
          score *= 2
        elsif params[:date_day].include?("Fri") && v.friday_special.length > 1
          puts "FRI SPECI"
          score *= 2
        elsif params[:date_day].include?("Sat") && v.saturday_special.length > 1
          score *= 2
        end
        score += v.blove_count.to_f
        venueHash[v] = score
        puts score
        score_sum += score
      }
      puts "Score Sum " + score_sum.to_s
      previous_range_endpoint = 0
      # venueHash = Hash[venueHash.sort_by{|k, v| v}.reverse]
      venueHash.each{
        |vName, vScore|
        tempScore = vScore
        venueHash[vName] = previous_range_endpoint...previous_range_endpoint+vScore/score_sum
        previous_range_endpoint += tempScore/score_sum
        puts "#{vName.name}, #{vScore}"
      }
      @venues.clear
      iterationCount = 0
      while(@venues.size < 5)
        iterationCount += 1
        puts "Iteration count #{iterationCount}"
        venueHash.each{
          |venue, vRange|
          randNumber = Random.rand(1.0)
          if(iterationCount > 100 || (vRange.include?(randNumber) && !@venues.include?(venue)))
            @venues.push(venue)
            puts "Random number: #{randNumber} includes #{venue.name}"
          end
        }
      end
    end
  end

  # GET /venues/cell/all
  # GET /venues/cell/all.json
  def cellVenue
    @venues = Venue.where(id: params[:id]) if params[:id].present?
    @venues = Venue.starts_with(params[:starts_with]) if params[:starts_with].present?

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
      params.require(:venue).permit(:name, :date_type, :price_rating, :neighborhood, :address, :blove_count, :dinner, :drinks,
        :dessert, :coffee, :mood, :date_day, :user_fbAccessToken, :menu_link,
        :polaroid_description, :monday_special, :tuesday_special, :wednesday_special, :thursday_special, 
        :friday_special, :saturday_special, :sunday_special, :food_drink, :why_blove_heading_1, 
        :why_blove_heading_2, :why_blove_heading_3, :why_blove_description_1, :why_blove_description_2,
        :why_blove_description_3, :price_for_two,:monday_hours, :tuesday_hours, :wednesday_hours, 
        :thursday_hours, :friday_hours, :saturday_hours, :sunday_hours, :crowd, :dress_code, :parking, 
        :reservations, :atmosphere, :keep_in_mind,
        :polaroid_image, :thumbnail_image, :venue_image_1, :venue_image_2, :venue_image_3, :venue_image_4, :venue_image_5)
    end
end
