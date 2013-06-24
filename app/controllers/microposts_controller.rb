class MicropostsController < ApplicationController

  # Csak a bejelentkezett felhasználó férhet hozzá a micropost létrehozásának és törlésének lehetőségéhez
  before_filter :signed_in_user, only: [:create, :destroy]
  # A törléshez pedig csak az az adott felhasználó, akihez a micropost tartozik
  before_filter :correct_user,   only: :destroy

  # Micropost létrehozása
  def create
  	# Létrehozunk egy új postot a jelenlegi felhasználóhoz kötve
	@micropost = current_user.microposts.build(params[:micropost])
	# Majd ezt elmentjük
	if @micropost.save
		flash[:success] = "Micropost created!"
		# Ezután pedig visszairányítjuk a felhasználót a főoldalra
		redirect_to root_url
	else
		@feed_items = []
		render 'static_pages/home'
	end
  end

  # Micropost törlése
  def destroy
  	# Kitöröljük
	@micropost.destroy
	# Utána pedig visszairányítjuk a főoldalra
	redirect_to root_url
  end

  private
  	# Ennek a függvénynek a segítségével vizsgáljuk, hogy a megfelelő user használja-e a kívánt funkciót
  	def correct_user
		@micropost = current_user.microposts.find_by_id(params[:id])
		redirect_to root_url if @micropost.nil?
	end
end