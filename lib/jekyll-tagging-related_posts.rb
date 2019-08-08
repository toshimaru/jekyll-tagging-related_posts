# frozen_string_literal: true

# requiring `jekyll/document` first to overide `Jekyll::Document`
require "jekyll/document"

require "jekyll/tagging/related_posts/version"
require "jekyll/tagging/related_posts"

module Jekyll
  class Document
    include ::Jekyll::Tagging::RelatedPosts
  end
end
