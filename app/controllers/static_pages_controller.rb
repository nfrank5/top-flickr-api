class StaticPagesController < ApplicationController
  require "flickr"
 
  def home
    flickr = Flickr.new Figaro.env.pusher_flickr_key, Figaro.env.pusher_flickr_secret
    @list = flickr.photos.getRecent
  end
end
