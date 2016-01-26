require "jekyll/tagging/related_posts/version"
require "jekyll/tagging/related_posts"

# require `Jekyll::Document` first to overide
require "jekyll/document"

module Jekyll
  class Document
    include ::Jekyll::Tagging::RelatedPosts
  end
end
