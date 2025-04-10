class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create

    # added this block to handle GET requests for testing
    if request.get?
      @category = Category.new
      render :new
      return
    end

    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end