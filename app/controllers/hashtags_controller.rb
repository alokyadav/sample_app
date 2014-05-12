class HashtagsController < ApplicationController

  def index
  end

  def show
  	#byebug
    @hashtag = SimpleHashtag::Hashtag.find_by_name(params[:id])
    @hashtagged = @hashtag.hashtaggables if @hashtag

    #@hashtagged.sort!{|a,b|a.created_at <=> b.created_at}
    @hashtagged.reverse!
    #byebug
  end

end
