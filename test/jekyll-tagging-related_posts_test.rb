require 'test_helper'

class TestPage < JekyllUnitTest
  def setup
    @site = fixture_site
    @site.process
    @document = @site.posts.docs.first
  end

  def test_document
    p @document.related_posts
  end

  def test_related_post
    @site.reset
    @site.read

    last_post     = @site.posts.docs.last
    related_posts = Jekyll::RelatedPosts.new(last_post).build

    last_10_recent_posts = (@site.posts.docs.reverse - [last_post]).first(10)
    assert_equal last_10_recent_posts, related_posts
  end
end
