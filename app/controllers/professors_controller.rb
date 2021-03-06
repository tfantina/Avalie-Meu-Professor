class ProfessorsController < ApplicationController
  before_action :set_professor, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_with_http_digest, except: [:index, :show, :search]
  before_action :check_configuration
  before_action :admin_user, only: :destory
  helper_method :sort_column, :sort_direction, :sort_class



  def check_configuration
    #render 'configuration_missing' if Cloudinary.config.api_key.blank?
  end


  def index
     @professors = Professor.paginate(:page => params[:page], per_page: 20).order(sort_column + " " + sort_direction)

  end

  def schools
    @professors = Professor.paginate(:page => params[:page], per_page: 20)
    @school = Professor.where(school: @professors.ids)
  end



  def show
    #  @review = Review.where(professor_id: @professor.id).order("created_at DESC")
      # @review = Review.where(professor_id: @professor.id).select(sort_class)
      @review = Review.where(professor_id: @professor.id)
    #   if params[:search].present?
    #       @review = Review.search(params[:search]).where(professor_id: @professor.id)
    #   else
    #       @review = Review.where(professor_id: @professor.id)
    #   end

    if @review.exists?
      @avg_review = @review.average(:rating).round(1)
    end
  end


  # GET /professors/new
  def new
    @professor = Professor.new

  end

  # POST /professors
  # POST /professors.json
  def create
    @schooldef = ['FGV', 'other']
    @professor = Professor.new(professor_params)
    @review = Review.new
    respond_to do |format|
      if verify_recaptcha(model: @professor) && @professor.save
        format.html { redirect_to controller: 'reviews', action: 'new', professor_id: @professor.id, notice: 'O professor foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @professor }
      else
        format.html { render :edit, notice: 'Por favor, preencha o captcha.' }
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


    def search
      if params[:search].present?
          @professors = Professor.search(params[:search])
      else
          @professors = Professor.all
      end
    end

    # GET /professors/1/edit
    def edit

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
    @professor.increment!(:flag)
    respond_to do |format|
      format.html { redirect_to @professor}
      format.js
 end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professor
      @professor = Professor.find(params[:id])
    end


    #may be used for image uploads
    def local_image_path(name)
      Rails.root.join('uploads', name).to_s
    end

    #options change if the user is logged as admin
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    #logic for sorting options that users will get, sanatized
    def sort_column
       %w[fullname school].include?(params[:sort]) ? params[:sort]: "created_at"
    end
    def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction]: "DESC"
    end

    def sort_class
    #  %w[fullname].include?(params[:sort]) ? params[:sort]: "created_at"
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def professor_params
      params.require(:professor).permit(:fullname, :school, :department, :terms_of_service #, :image [:image_file_name. :image_file_size, :image_content_type, :image_updated_at])
    )
    end
end
