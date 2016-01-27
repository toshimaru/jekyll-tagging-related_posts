$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'jekyll-tagging-related_posts'
require 'jekyll'
require 'jekyll/tagging'

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
require 'rspec/mocks'

class JekyllUnitTest < Minitest::Test
  include ::RSpec::Mocks::ExampleMethods
  include Jekyll

  def mocks_expect(*args)
    RSpec::Mocks::ExampleMethods::ExpectHost.instance_method(:expect).\
      bind(self).call(*args)
  end

  def before_setup
    RSpec::Mocks.setup
    super
  end

  def after_teardown
    super
    RSpec::Mocks.verify
  ensure
    RSpec::Mocks.teardown
  end

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

  def clear_dest
    FileUtils.rm_rf(dest_dir)
    FileUtils.rm_rf(source_dir('.jekyll-metadata'))
  end

  def test_dir(*subdirs)
    File.join(File.dirname(__FILE__), *subdirs)
  end

  def directory_with_contents(path)
    FileUtils.rm_rf(path)
    FileUtils.mkdir(path)
    File.open("#{path}/index.html", "w"){ |f| f.write("I was previously generated.") }
  end

  def with_env(key, value)
    old_value = ENV[key]
    ENV[key] = value
    yield
    ENV[key] = old_value
  end

  def capture_output
    stderr = StringIO.new
    Jekyll.logger = Logger.new stderr
    yield
    stderr.rewind
    return stderr.string.to_s
  end
  alias_method :capture_stdout, :capture_output
  alias_method :capture_stderr, :capture_output

  def nokogiri_fragment(str)
    Nokogiri::HTML.fragment(
      str
    )
  end
end
