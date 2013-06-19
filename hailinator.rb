require 'twitter'
require 'csv'



Twitter.configure do |config|
  config.consumer_key = "VMAleXfWADGOxB9G61gufQ"
  config.consumer_secret = "igEJePXxeiaZFNXEnL8RTQR86aOL5Xz7Zt3EruLVes"
  config.oauth_token = "18496388-x9mDwr8tDbxr0yktOGkI7n5JMfZoounklSV2Q1OuX"
  config.oauth_token_secret = "SgieAjvGOn60dhNpvgzIBnvyrUTdL8MEjGCFIXEQJqk"
end

# Twitter.update("I'm tweeting with @gem!")


CSV.open("haildamage.csv", "wb") do |csv|
	csv << ["handle", "text", "url"]

	Twitter.search("#hail" "#rain", :lang => "en", :count => 10).results.each do |tweet|
		csv << [tweet.from_user, tweet.full_text, "https://twitter.com/#{tweet.from_user}/statuses/#{tweet.id}"]
	end
end



