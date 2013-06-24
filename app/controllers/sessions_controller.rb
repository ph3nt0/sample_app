class SessionsController < ApplicationController

	def new

	end

	def create
		# Keressük meg a user-t a kapott email alapján...
		user = User.find_by_email(params[:session][:email].downcase)
		# ... majd vizsgáljuk meg a kapott jelszót
		if user && user.authenticate(params[:session][:password])
			sign_in user
			#Ha egy másik oldal irányította át, irányítsuk vissza oda, ha nem akkor pedig a user oldalra
			redirect_back_or user
  		else
  			# A jelszó nem egyezett a tárolttal
			flash.now[:error] = 'Invalid email/password combination'
			render 'new'
		end
    end

	def destroy
		sign_out
		redirect_to root_url
	end
end
