module ApplicationHelper

	# Hozzáadja a 'Ruby on Rails Tutorial Sample App'-t a kapott stringhez
	def full_title(page_title)

		base_title = "Ruby on Rails Tutorial Sample App"
		# Ha a kapott paraméter egy üres string akkor csak az alap címet adja vissza
		if page_title.empty?
			base_title
		#Ha nem akkor pedig az 'Alap cím | kapott szöveg' formátumot
		else
			"#{base_title} | #{page_title}"
		end
	end
end
