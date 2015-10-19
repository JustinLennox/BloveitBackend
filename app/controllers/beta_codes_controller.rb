class BetaCodesController < ApplicationController
  before_action :set_beta_code, only: [:show, :edit, :update, :destroy]

  # GET /beta_codes
  # GET /beta_codes.json
  def index
    @beta_codes = BetaCode.all
  end

  # GET /beta_codes/1
  # GET /beta_codes/1.json
  def show
  end

  # GET /beta_codes/bCode/:code.json
  # GET /beta_codes/bCode/:code.json
  def bCode
    @beta_code = BetaCode.find_by(code: params[:code]) 
    @beta_code.update_column(:user_count, @beta_code.user_count+1)
  end

  # GET /beta_codes/new
  def new
    @beta_code = BetaCode.new
  end

  # GET /beta_codes/1/edit
  def edit
  end

  # POST /beta_codes
  # POST /beta_codes.json
  def create
    @beta_code = BetaCode.new(beta_code_params)

    respond_to do |format|
      if @beta_code.save
        format.html { redirect_to @beta_code, notice: 'Beta code was successfully created.' }
        format.json { render :show, status: :created, location: @beta_code }
      else
        format.html { render :new }
        format.json { render json: @beta_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /beta_codes/1
  # PATCH/PUT /beta_codes/1.json
  def update
    respond_to do |format|
      if @beta_code.update(beta_code_params)
        format.html { redirect_to @beta_code, notice: 'Beta code was successfully updated.' }
        format.json { render :show, status: :ok, location: @beta_code }
      else
        format.html { render :edit }
        format.json { render json: @beta_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /beta_codes/1
  # DELETE /beta_codes/1.json
  def destroy
    @beta_code.destroy
    respond_to do |format|
      format.html { redirect_to beta_codes_url, notice: 'Beta code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_beta_code
      @beta_code = BetaCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def beta_code_params
      params.require(:beta_code).permit(:code, :user_max, :user_count)
    end
end
