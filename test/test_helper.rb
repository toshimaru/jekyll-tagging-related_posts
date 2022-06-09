# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'simplecov'
SimpleCov.start

require 'jekyll-tagging-related_posts'
require 'jekyll'

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class JekyllUnitTest < Minitest::Test
  include Jekyll

  def fixture_site(overrides = {})
    Jekyll::Site.new(site_configuration(overrides))
  end

  def build_configs(overrides, base_hash = default_configuration)
    Utils.deep_merge_hashes(base_hash, overrides)
  end

  def default_configuration
    Marshal.load(Marshal.dump(Jekyll::Configuration::DEFAULTS))
  end

  def site_configuration(overrides = {})
    full_overrides = build_configs(overrides, build_configs(
      "destination" => dest_dir,
      "incremental" => false
    ))
    Configuration.from(full_overrides.merge("source" => source_dir))
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
