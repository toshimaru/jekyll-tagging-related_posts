require "jekyll"
require "jekyll/tagging/related_posts/version"
require "jekyll/tagging/related_posts"

module Jekyll
  class Document
    include ::Jekyll::Tagging::RelatedPosts
  end
end
