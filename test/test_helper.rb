$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'jekyll-tagging-related_posts'
require 'jekyll'
require 'jekyll/tagging'

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class JekyllUnitTest < Minitest::Test
  include Jekyll

  def fixture_site(overrides = {})
    Jekyll::Site.new(site_configuration(overrides))
  end

  def build_configs(overrides, base_hash = Jekyll::Configuration::DEFAULTS)
    Utils.deep_merge_hashes(base_hash, overrides)
      .fix_common_issues.backwards_compatibilize.add_default_collections
  end

  def site_configuration(overrides = {})
    full_overrides = build_configs(overrides, build_configs({
      "destination" => dest_dir,
      "incremental" => false
    }))
    build_configs({
      "source" => source_dir
    }, full_overrides)
  end

  def dest_dir(*subdirs)
    test_dir('dest', *subdirs)
  end

  def source_dir(*subdirs)
    test_dir('source', *subdirs)
  end

  def test_dir(*subdirs)
    File.join(File.dirname(__FILE__), *subdirs)
  end
end
