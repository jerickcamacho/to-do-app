class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]

  # GET /categorys or /categorys.json
  def index
    @categories = Category.all
  end

  # GET /categorys/1 or /categorys/1.json
  def show
  end

  # GET /categorys/new
  def new
    @category = Category.new
  end

  # GET /categorys/1/edit
  def edit
  end

  # POST /categorys or /categorys.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: "category was successfully created." }
        #format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categorys/1 or /categorys/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: "category was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categorys/1 or /categorys/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: "category was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name, :category_id)
    end
end
