class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
#validates :long_url, uniqueness: {case_sensitive: false, message: "was shortened before"}
#validates :long_url, format: {with: (URI::regexp(['http', 'https'])), message: "format is not good"}	
validates :long_url, format: { with: /\A(https|http):\/\//}   # this jQuery

before_save :shorten

	def shorten
		r = ""  # empty string

		# 7.times{ r += rand (10).to_s}  just the numbers

		# range = [*'0'..'9',*'A'..'Z', *'a'..'z']    another method
		 # @short_url = (6...0).map {range.sample}.join

		7.times do |alphanum|
			case  rand (3)
			when 0
				r += (97 + rand(25)).chr
			when 1

				r += (65 + rand(25)).chr
			when 2
				r += rand(10).to_s
			end  
		end
		
		self.short_url = r

	end
end
