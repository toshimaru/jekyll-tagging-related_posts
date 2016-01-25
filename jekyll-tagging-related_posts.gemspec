# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll/tagging/related_posts/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-tagging-related_posts"
  spec.version       = Jekyll::Tagging::RelatedPosts::VERSION
  spec.authors       = ["toshimaru"]
  spec.email         = ["me@toshimaru.net"]

  spec.summary       = %q{Replaces Jekyll's related_posts function to use tags to calculate relationships}
  spec.description   = %q{Replaces Jekyll's related_posts function to use tags to calculate relationships}
  spec.homepage      = "https://github.com/toshimaru/jekyll-tagging-related_posts"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "jekyll", "~> 3.0"
  spec.add_runtime_dependency "jekyll-tagging", "~> 1.0.0"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "minitest"
end
