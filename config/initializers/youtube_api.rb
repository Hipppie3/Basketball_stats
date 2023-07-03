require 'google/apis/youtube_v3'

# Set up API client
Google::Apis::RequestOptions.default.authorization = ENV['AIzaSyD_iL6oMUzaiU3Ql4t1yGN7bu3Tz4xLFAk']
youtube_service = Google::Apis::YoutubeV3::YouTubeService.new
