# frozen_string_literal: true

# Require `jekyll/document` to override `Jekyll::Document`
require "jekyll/document"

require "jekyll/tagging/related_posts/version"
require "jekyll/tagging/related_posts"

module Jekyll
  class Document
    include ::Jekyll::Tagging::RelatedPosts
  end
end
