class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_professor


  # GET /reviews/new
  def new
    @review = Review.new


  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json


  #---------------The user login system has been disabled for everyone except admins
  # in the future we may add user login functionality but at the moment it seems
  #counter intuitive to getting as many students to user the service as possible.  ----------------#


  def create
  #if user_signed_in?
  #  @review = current_user.reviews.create(review_params)
  #    @review.professor_id = @professor.id
  #    @review.save
  #    redirect_to @professor
  #  else
      @review = Review.create(review_params)
      @review.professor_id = @professor.id
      @review.guest = :guest
      respond_to do |format|
      if verify_recaptcha(model: @review) && @review.save
        format.html{ redirect_to @professor, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new, notice: 'Please fill out the captcha.'}
        format.json { render json: @review.errors, status: :unprocessable_entity}
      end
   end
  end


  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def flag
      @review = Review.find(params[:id])
      @review.increment!(:flag)


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    def set_professor
      @professor = Professor.find(params[:professor_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:rating, :ease, :helpfull, :interest, :comment)
    end
end
