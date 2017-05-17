enable :sessions

get '/' do

	@url = Url.limit(7)
	
  erb :"static/index"
end

# get '/profile' do
#  erb :"static/profile"
# end

post "/urls" do 
	long = Url.new(long_url: params[:long_url])
	
	if long.save
		# @error = false
		flash[:success] = "Congrats, you created a bitly link."
	else
		flash[:error] = "Woops, something went wrong."
		flash[:danger] = "Please type correct link"
		# @error = true
	end
	redirect to '/'
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
	redirect to "http://" + link.long_url
end
