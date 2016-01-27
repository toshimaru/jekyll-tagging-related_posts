require 'test_helper'

class TestPage < JekyllUnitTest
  def setup
    @site = fixture_site
    @site.process
    @document = @site.posts.docs.first
  end

  def test_tag_name
    assert_equal 'foo', @document.data["tags"].first
  end

  def test_related_posts
    assert_instance_of Array, @document.related_posts
  end

  def test_related_posts
    assert_instance_of Jekyll::Document, @document.related_posts.first
  end

  def test_related_posts_count
    assert_equal 2, @document.related_posts.count
  end

  def test_related_post_tag
    assert_includes @document.related_posts.first.data["tags"], 'foo'
  end
end
