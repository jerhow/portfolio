class PortfolioItemsController < ApplicationController

  def index
    @portfolio_items = PortfolioItem.all
  end

  def angular
    @angular_portfolio_items = PortfolioItem.angular
  end

  def new
    @portfolio_item = PortfolioItem.new
    3.times { @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item = PortfolioItem.new(portfolio_item_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolio_items_path, notice: 'Portfolio item was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @portfolio_item = PortfolioItem.find(params[:id])
  end

  def update
    @portfolio_item = PortfolioItem.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(portfolio_item_params)
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

  def destroy
    # Perform the lookup
    @portfolio_item = PortfolioItem.find(params[:id])
    
    # Destroy the record
    @portfolio_item.destroy

    # Redirect
    respond_to do |format|
      format.html { redirect_to portfolio_items_url, notice: 'Record was removed.' }
      # format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:portfolio_item).permit(:title, :subtitle, :body)
    end

    def portfolio_item_params
      params.require(:portfolio_item).permit(:title, 
                                             :subtitle, 
                                             :body, 
                                             technologies_attributes: [:name])
    end

end
