# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll/tagging/related_posts/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-tagging-related_posts"
  spec.version       = Jekyll::Tagging::RelatedPosts::VERSION
  spec.authors       = ["toshimaru"]
  spec.email         = ["me@toshimaru.net"]

  spec.summary       = %q{Jekyll `related_posts` function based on tags (works on Jekyll3)}
  spec.description   = %q{Jekyll `related_posts` function based on tags (works on Jekyll3). It replaces original Jekyll's `related_posts` function to use tags to calculate relationships.}
  spec.homepage      = "https://github.com/toshimaru/jekyll-tagging-related_posts"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.3"

  spec.add_runtime_dependency "jekyll", ">= 3.5", "< 5.0"
  spec.add_runtime_dependency "jekyll-tagging", "~> 1.0"

  spec.add_development_dependency "appraisal"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "codeclimate-test-reporter"
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "rake"
end
