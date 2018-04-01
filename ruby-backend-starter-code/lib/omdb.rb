require 'dotenv'

module Sinatra
  module Omdb
    class Client
      include HTTParty

      API_URL = "http://www.omdbapi.com/"
      API_KEY = ENV["OMDB_API_KEY"]

      def search_title(title)
        title = CGI.escape(title)
        query = API_URL + "?apikey=#{API_KEY}&t=#{title}&y=&plot=short&r=json"
        self.class.get query
      end

      def search_keyword(keyword)
        keyword = CGI.escape(keyword)
        query = API_URL + "?apikey=#{API_KEY}&s=#{keyword}&y=&plot=short&r=json"
        self.class.get query
      end
    end
  end
end

