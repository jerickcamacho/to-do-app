class CategoriesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user

  #before_action :set_category, only: %i[ show edit update destroy ]

  # GET /categorys or /categorys.json
  def index
    @categories = @user.categories
  end

  # GET /categorys/1 or /categorys/1.json
  def show
    @category = @user.categories.find(params[:id])
  end

  # GET /categorys/new
  def new
    @category = @user.categories.build
  end

  # GET /categorys/1/edit
  def edit
    #@list =@category.lists.find(params[:id])
    @category = @user.categories.find(params[:id])
  end

  # POST /categorys or /categorys.json
  def create
    @category = @user.categories.build(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to [@user, @category], notice: "category was successfully created." }
        #format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categorys/1 or /categorys/1.json
  def update
    @category = @user.categories.find(params[:id])

    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to [@user, @category], notice: "category was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categorys/1 or /categorys/1.json
  def destroy
    @category = @user.categories.find(params[:id])

    @category.destroy
    respond_to do |format|
      format.html { redirect_to [@user, @category], notice: "category was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_category
    #   @category = Category.find(params[:id])
    # end

    def set_user
      @user = current_user
    end
    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name, :user_id)
    end
end
