class ListsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_user

  before_action :set_category 
  #before_action :set_list, only: %i[index show new create edit update destroy]

  # GET /lists or /lists.json
  def index
    if params[:due_date]
      @lists = @category.lists.where(due_date: Date.today).where(completed: false)
      render template: 'lists/index_tasks_today.html.erb'
    else

      @lists = @category.lists
    end
  end

  # GET /lists/1 or /lists/1.json
  def show
    @list = @category.lists.find(params[:id])
  end

  # GET /lists/new
  def new
    @list = @category.lists.build
  end

  # GET /lists/1/edit
  def edit
    @list =@category.lists.find(params[:id])
  end

  # POST /lists or /lists.json
  def create
    @list = @category.lists.build(list_params)
    @list.user = @user

    respond_to do |format|
      if @list.save
        format.html { redirect_to user_category_lists_path(@user, @category), notice: "List was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }

      end
    end
  end

  # PATCH/PUT /lists/1 or /lists/1.json
  def update
    @list = @category.lists.find(params[:id])
    @list.user = @user

    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to user_category_lists_path(@user, @category), notice: "List was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1 or /lists/1.json
  def destroy
    @list = @category.lists.find(params[:id])
    @list.user = @user   

    if @list.present?
      @list.destroy
    end

    #@list.destroy
    respond_to do |format|
      format.html { redirect_to user_category_lists_path(@user, @category), notice: "List was successfully removed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:category_id])
    end

    #def set_list
      #@list = List.find(params[:id])
    #end

    def set_user 
      @user = current_user
    end  

    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:list).permit(:description, :completed, :category_id, :due_date, :user_id)
    end
end
