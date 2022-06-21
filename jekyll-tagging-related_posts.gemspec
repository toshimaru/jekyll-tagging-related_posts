# frozen_string_literal: true

require_relative 'lib/jekyll/tagging/related_posts/version'

Gem::Specification.new do |spec|
  spec.name = "jekyll-tagging-related_posts"
  spec.version = Jekyll::Tagging::RelatedPosts::VERSION
  spec.authors = ["toshimaru"]
  spec.email = ["me@toshimaru.net"]

  spec.summary = %q{Jekyll `related_posts` function based on tags (works on Jekyll3)}
  spec.description = %q{Jekyll `related_posts` function based on tags (works on Jekyll3). It replaces original Jekyll's `related_posts` function to use tags to calculate relationships.}
  spec.homepage = "https://github.com/toshimaru/jekyll-tagging-related_posts"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/toshimaru/jekyll-tagging-related_posts/releases"
  
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "jekyll", ">= 3.9", "< 5.0"
end
