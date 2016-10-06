class ProfessorsController < ApplicationController
  before_action :set_professor, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_with_http_digest, except: [:index, :show, :search]
  before_filter :check_configuration

  def check_configuration
    #render 'configuration_missing' if Cloudinary.config.api_key.blank?
  end

  # GET /professors
  # GET /professors.json
  def index
     @professors = Professor.paginate(:page => params[:page], per_page: 20)

  end

  # GET /professors/1
  # GET /professors/1.json

  def show
      @review = Review.where(professor_id: @professor.id).order("created_at DESC")
      #@user = User.where(user_id: @review.user_id)   <===== uncomment when showing users.
      @avg_review = @review.average(:hw)
      render


  end


  # GET /professors/new
  def new
    @professor = Professor.new
    # Replace above with: @professor = current_user.professors.build  when implementing user model
  end

  def search
    if params[:search].present?
        @professors = Professor.search(params[:search])
    else
        @professors = Professor.all
    end
  end

  # GET /professors/1/edit
  def edit
    flag = Professor.update(params[:flag])
    if flag.save!
      render :status => 200
    else
      render "Problem"
    end
  end

  # POST /professors
  # POST /professors.json
  def create
    @professor = Professor.create(professor_params)
    respond_to do |format|
      if @professor.save
        format.html { redirect_to @professor, notice: 'Professor was successfully created.' }
        format.json { render :show, status: :created, location: @professor }
      else
        format.html { render :new }
        format.json { render json: @professor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /professors/1
  # PATCH/PUT /professors/1.json
  def update
    respond_to do |format|
      if @professor.update(professor_params)
        format.html { redirect_to @professor, notice: 'Professor was successfully updated.' }
        format.json { render :show, status: :ok, location: @professor }
      else
        format.html { render :edit }
        format.json { render json: @professor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professors/1
  # DELETE /professors/1.json
  def destroy
    @professor.destroy
    respond_to do |format|
      format.html { redirect_to professors_url, notice: 'Professor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


#working with ajax to allow users to flag profesor without refreshing.

  def flag
    @professor = Professor.find(params[:id])
    @professor.flag + 1

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professor
      @professor = Professor.find(params[:id])
    end
    def local_image_path(name)
      Rails.root.join('uploads', name).to_s
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def professor_params
      params.require(:professor).permit(:fullname, :school, :department #, :image [:image_file_name. :image_file_size, :image_content_type, :image_updated_at]
      )
    end
end
