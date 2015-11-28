class DateStoriesController < ApplicationController
  before_action :set_date_story, only: [:show, :edit, :update, :destroy]

  # GET /date_stories
  # GET /date_stories.json
  def index
    @date_stories = DateStory.all
  end

  # GET /date_stories/1
  # GET /date_stories/1.json
  def show
  end

  # GET /date_stories/new
  def new
    @date_story = DateStory.new
  end

  # GET /date_stories/1/edit
  def edit
  end

  # POST /date_stories
  # POST /date_stories.json
  def create
    @date_story = DateStory.new(date_story_params)
    @date_story.user = User.find_by(fbAccessToken: date_story_params[:user_fbAccessToken])
    @date_story.venue = Venue.find(date_story_params[:venue_id])
    respond_to do |format|
      if @date_story.save
        format.html { redirect_to @date_story, notice: 'Date story was successfully created.' }
        format.json { render :show, status: :created, location: @date_story }
      else
        format.html { render :new }
        format.json { render json: @date_story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /date_stories/1
  # PATCH/PUT /date_stories/1.json
  def update
    respond_to do |format|
      if @date_story.update(date_story_params)
        format.html { redirect_to @date_story, notice: 'Date story was successfully updated.' }
        format.json { render :show, status: :ok, location: @date_story }
      else
        format.html { render :edit }
        format.json { render json: @date_story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /date_stories/1
  # DELETE /date_stories/1.json
  def destroy
    @date_story.destroy
    respond_to do |format|
      format.html { redirect_to date_stories_url, notice: 'Date story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_date_story
      @date_story = DateStory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def date_story_params
      params.require(:date_story).permit(:storyText,
       :approved, :user, :venue_id, :user_id, :user_fbAccessToken, :user, 
       :did_enjoy, :would_recommend, :date_type, :food, :drinks, :zervice, :decor, :vibe)
    end
end
