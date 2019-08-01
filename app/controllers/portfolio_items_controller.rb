class PortfolioItemsController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :show, :update, :destroy]
  layout "portfolio"

  # For Petergate
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

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
    # Lookup now happening in set_portfolio_item, per before_action
  end

  def update
    # Lookup now happening in set_portfolio_item, per before_action

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
    # Lookup now happening in set_portfolio_item, per before_action
  end

  def destroy
    # Lookup now happening in set_portfolio_item, per before_action
    
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

    def set_portfolio_item
     @portfolio_item = PortfolioItem.find(params[:id]) 
    end

end
