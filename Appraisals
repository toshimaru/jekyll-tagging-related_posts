# frozen_string_literal: true

SUPPORTED_JEKYLL_VERSIONS = %w[3.9].freeze

SUPPORTED_JEKYLL_VERSIONS.each do |version|
  appraise "jekyll-#{version}" do
    gem "jekyll", "~> #{version}.0"
  end
end
