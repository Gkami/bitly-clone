enable :sessions

get '/' do

	@url = Url.limit(7)
	
  erb :"static/index"
end

# get '/profile' do
#  erb :"static/profile"
# end

post "/urls" do
p params 
	long = Url.new(long_url: params[:long_url])
	
	if long.save
		# @error = false
		Url.order('created_at DESC').first(7).to_json(except: :id)
		# flash[:success] = "Congrats, you created a bitly link."
	else
		# flash[:error] = "Woops, something went wrong."
		# flash[:danger] = "Please type correct link"
		# @error = true
	end
	# redirect to '/'
end

# post '/long_url' do
# 	x = Url.new
# 	x.long_url = params[:long_url]
# 	x.shorten

# 	if x.save
# 		@error = false
# 	else
# 		@error = true
# 	end
# 	@urls = [x]
# 	erb :"static/index"
# end


get '/:short_url' do
	
	link = Url.find_by(short_url: params[:short_url])
	link.count_click += 1
	link.save
	redirect to link.long_url
end
