class PagesController < ApplicationController
  def home
    @posts = Blog.all
    # ^^ Here we are calling the Blog model, asking for all() of what it has,
    # and storing the results in an instance variable. Apparently you have access
    # to any model from any controller. By assigning the output to an instance
    # variable, it becomes available to this route's corresponding view
    # (in this case, 'home.html.erb'). 
    #
    # Right now in the view, we've referenced this instance variable as such:
    # <%= @posts.inspect %>
    # 
    # This demonstrates how data flows between models, controllers and views
  end

  def about
  end

  def contact
  end
end
