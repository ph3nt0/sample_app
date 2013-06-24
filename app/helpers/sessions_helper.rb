module SessionsHelper
	def sign_in(user)
		cookies.permanent[:remember_token] = user.remember_token
		self.current_user = user
	end 

	def current_user=(user)
		@current_user = user
	end

	def current_user
		@current_user ||= User.find_by_remember_token(cookies[:remember_token])
	end

	def current_user?(user)
		user == current_user
	end
	# Vizsgálja, hogy a felhasználó be van-e jelentkezve
	def signed_in_user
		# Ha nincs...
		unless signed_in?
			# ... akkor mentsük el, hol volt...
			store_location
			# ... és irányítsuk át a bejelentkezési URL-re
			redirect_to signin_url, notice: "Please sign in."
		end
	end

	# Létezik-e a current_user?
	def signed_in?
		!current_user.nil?
	end

	# Kijelentkeztetjük a felhasználót és töröljük a cookie-kat
	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end

	def redirect_back_or(default)
		# Ha van tárolt cím, ahonnan átirányítottuk a felhasználót, küldjük oda, ha nincs akkor a kapott oldalra
		redirect_to(session[:return_to] || default)
		# És töröljük ki a session-ből a :return_to változót
		session.delete(:return_to)
	end

	# Beállítja a kérés forrásának URL-jét a session return_to változójává
	def store_location
		session[:return_to] = request.url
	end

	# Session létrehozása
	def create
		user = User.find_by_email(params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_back_or user
		else
			flash.now[:error] = 'Invalid email/password combination'
			render 'new'
		end
	end
end
