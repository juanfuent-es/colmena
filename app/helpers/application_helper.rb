module ApplicationHelper

	def device
		require "browser"
		if browser.device.mobile?
			return "mobile"
		elsif browser.device.tablet?
			return "tablet"
		else
			return "desktop"
		end
	end

	def canonical
		request.original_url.gsub('http','https').gsub('www','')
	end

	def current_domain
		"#{request.protocol}#{request.host_with_port}"
	end

	def meta_date _date
		if _date.empty?
			return Date.today.strftime("%Y-%m-%d")
		else
			return _date.to_date.strftime("%Y-%m-%d")
		end
	end

	def only_text(_str="")
		Nokogiri::HTML(_str).text
	end

	def default_description
		if I18n.locale == :es
			"Spanish Lorem Ipsum"
		else
			"English Lorem Ipsum"
		end
	end

	def full_title title
		base_title = "JuanFuent.es" # "#{Rails.application.credentials.app_name}"
		_title = only_text(title)
		if title.empty? || base_title == _title
			"Community Building | #{base_title}"
		else
			"#{_title} | #{base_title}"
		end
	end

	def remove_spaces(html)
		return html.gsub(/\s+/, " ").strip
	end

	def meta_description (description)
		description.empty? ? default_description : description
	end

	def breadcrumb(_url="")
		urls = ["Home"]
		urls << _url if _url.present?
		return urls.join(" > ")
	end

	def meta_keys keys
		return keys.empty? ? "" : ""
	end

	def slugize(str)
		# Transliterate: Replaces non-ASCII characters with an ASCII approximation, or if none exists, a replacement character which defaults to “?”.
		# @see: https://apidock.com/rails/v5.2.3/ActiveSupport/Inflector/transliterate
		_slug = ActiveSupport::Inflector.transliterate(str)
		# downcase and remove extra spaces
		#@see: https://apidock.com/ruby/String/strip
		_slug = _slug.downcase.strip
		# convert spaces to '-'
		return _slug.gsub(/\W+/, "-")
		# return _slug.gsub(/[^0-9A-Za-z]/, '')
	end

	def switch_language_url(current_url, target_lang)
		# Extraer el idioma actual de la URL
		current_lang = current_url.split('/')[1]
		# Reemplazar el idioma en la URL
		new_url = current_url.sub("/#{current_lang}/", "/#{target_lang}/")
		new_url
	end

end