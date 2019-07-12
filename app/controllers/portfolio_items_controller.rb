class PortfolioItemsController < ApplicationController

  def index
    @portfolio_items = PortfolioItem.all
  end

  def new
    @portfolio_item = PortfolioItem.new
  end

  def create
    @portfolio_item = PortfolioItem.new(blog_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolio_items_path, notice: 'Portfolio item was successfully created.' }
        # format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        # format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @portfolio_item = PortfolioItem.find(params[:id])
  end

  def update
    @portfolio_item = PortfolioItem.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(blog_params)
        format.html { redirect_to portfolio_items_path, notice: 'Record was successfully updated.' }
        # format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        # format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @portfolio_item = PortfolioItem.find(params[:id])

  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:portfolio_item).permit(:title, :subtitle, :body)
    end

end
