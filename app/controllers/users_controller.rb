class UsersController < ApplicationController

	# Szűrjük, hogy ki férhessen hozzá egyes oldalakhoz
	before_filter :signed_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
	before_filter :correct_user,   only: [:edit, :update]
	before_filter :admin_user,     only: :destroy

  def show
  	# Kilistázzuk a felhasználó micropostjait, oldalakra bontva
  	@user = User.find(params[:id])
  	@microposts = @user.microposts.paginate(page: params[:page])
  end

  def new
  	@user = User.new
  end

  def index
  	@users = User.paginate(page: params[:page])
  end

  # Új felhasználó létrehozása
  def create
	@user = User.new(params[:user])
	# Ha sikerült elmenteni az adatbázisba...
	if @user.save
		# ... akkor jelentkeztessük be, írjuk ki neki, hogy sikeres volt és irányítsuk át a saját oldalára
		sign_in @user
		flash[:success] = "Welcome to the Sample App!"
		redirect_to @user
	else
		render 'new'
	end
  end

  def edit
  end

  # Profil frissítése
  def update
  	# Ha sikeresen frissítettük...
  	if @user.update_attributes(params[:user])
  		# ... írjuk ki és irányítsuk át a saját oldalára
		flash[:success] = "Profile updated"
		sign_in @user
		redirect_to @user
	else
		render 'edit'
	end
  end

  # Felhasználó törlese
  # Ehhez a fájl elején meghatározott korlátozások alapján csak az admin férhet hozzá
  def destroy
	User.find(params[:id]).destroy
	flash[:success] = "User destroyed."
	redirect_to users_url
  end

  # A felhasználó által követett emberek
  def following
	@title = "Following"
	# Megkeressük a felhasználót az adatbázisban
	@user = User.find(params[:id])
	# Lekérjük a felhasználó által követett felhasználókat, majd oldalakra bontva megjelenítjük a 'show_follow' segítségével
	@users = @user.followed_users.paginate(page: params[:page])
	render 'show_follow'
  end

  # Követők, a gyakorlat ugyanaz mint a követett felhasználóknál, csak itt a követőket kérjük le az adatbázisból
  def followers
	@title = "Followers"
	@user = User.find(params[:id])
	@users = @user.followers.paginate(page: params[:page])
	render 'show_follow'
  end

  private

  	# Ennek a segítségével vizsgáljuk meg, hogy a felhasználó be van-e jelentkezve
	def signed_in_user
		# Ha nincs...
		unless signed_in?
			# ... elmentjük az aktuális helyet...
			store_location
			# ... és átirányítjuk a bejelentkezés oldalra egy üzenet kíséretében
			redirect_to signin_url, notice: "Please sign in."
		end
	end

	# Ennek a segítségével vizsgáljuk meg, hogy a megfelelő (vagyis az aktuális) felhasználó böngészi-e az adott oldalt
	def correct_user
		# Lekérjük a felhasználót az adatbázisból
		@user = User.find(params[:id])
		#Átirányítjuk a főoldalra, kivéve ha az aktuális felhasználó megegyezik az 'id' paraméterként kapott felhasználóval
		redirect_to(root_path) unless current_user?(@user)
	end

	# Ennek a segítségével vizsgáljuk meg, hogy az aktuális felhasználó admin-e.
	def admin_user
		# Átirányítjuk a főoldalra, kivéve ha admin.
		redirect_to(root_path) unless current_user.admin?
	end

end
