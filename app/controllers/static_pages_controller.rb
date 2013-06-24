class StaticPagesController < ApplicationController
  def home
  	# Ha be van jelentkezve, akkor mutassuk a micropostokat
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end

  end

  def help
  end
  
  def contact
  end

  def about
  end
end
