class StaticPagesController < ApplicationController
  require "flickr"
 
  def home
    flickr = Flickr.new Figaro.env.pusher_flickr_key, Figaro.env.pusher_flickr_secret
    begin
      @list = flickr.people.getPublicPhotos(api_key: Figaro.env.pusher_flickr_key, user_id: params[:flickr_user_id])
    rescue
      @list = []
    end
  end
end
