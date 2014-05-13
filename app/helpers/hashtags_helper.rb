module HashtagsHelper
  def linkify_hashtags(hashtaggable_content)
    regex = SimpleHashtag::Hashtag::HASHTAG_REGEX
    hashtagged_content = hashtaggable_content.to_s.gsub(regex) do
      link_to($&, hashtag_path($2), {class: :hashtag})
    end
    hashtagged_content.html_safe
  end

  def render_hashtaggable(hashtaggable)
    klass        = hashtaggable.class.to_s.underscore
    view_dirname = klass.pluralize
    partial      = klass
    render "shared/feed_item", {:feed_item => hashtaggable}
  end
  def render_tags
    SimpleHashtag::Hashtag.clean_orphans
    @hashtags = SimpleHashtag::Hashtag.all
    h_dict = {}
    @hashtags.each do  |item|
      h_dict[item.name.to_sym] = item.hashtaggables.count 
    end
    @hashpopulartag = []
    h_dictArry = h_dict.sort_by {|k,v| v}.reverse.take(10)
    h_dictArry.each do |key, value|
      @hashpopulartag << SimpleHashtag::Hashtag.find_by_name(key.to_sym)
    end
    #@hashpopulartag
    render "hashtags/trending"
  end

end
