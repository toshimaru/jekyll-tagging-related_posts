# jekyll-tagging-related_posts

[![Build Status](https://travis-ci.org/toshimaru/jekyll-tagging-related_posts.svg?branch=master)](https://travis-ci.org/toshimaru/jekyll-tagging-related_posts)
[![Gem Version](https://badge.fury.io/rb/jekyll-tagging-related_posts.svg)](https://badge.fury.io/rb/jekyll-tagging-related_posts)
[![Test Coverage](https://codeclimate.com/github/toshimaru/jekyll-tagging-related_posts/badges/coverage.svg)](https://codeclimate.com/github/toshimaru/jekyll-tagging-related_posts/coverage)
[![Code Climate](https://codeclimate.com/github/toshimaru/jekyll-tagging-related_posts/badges/gpa.svg)](https://codeclimate.com/github/toshimaru/jekyll-tagging-related_posts)

Jekyll `related_posts` function based on tags (works on Jekyll3). It replaces original Jekyll's `related_posts` function to use tags to calculate relationships.

The calculation algorithm is based on [related\_posts-jekyll\_plugin](https://github.com/LawrenceWoodman/related_posts-jekyll_plugin) by [@LawrenceWoodman](https://github.com/LawrenceWoodman).

## Requirements

* Ruby 2.3+
* [Jekyll](https://github.com/jekyll/jekyll) 3.5+
* [pattex/jekyll-tagging](https://github.com/pattex/jekyll-tagging)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jekyll-tagging-related_posts'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jekyll-tagging-related_posts

## Usage

Edit `_config.yml` to use the plug-in:

```yml
gems:
  - jekyll/tagging
  - jekyll-tagging-related_posts
```

Then, add `site.related_posts` in your post layout page. For example:

```liquid
{% if site.related_posts.size >= 1 %}
<div>
  <h3>Related Posts</h3>
  <ul>
  {% for related_post in site.related_posts limit: 5 %}
    <li><a href="{{ related_post.url }}">{{ related_post.title }}</a></li>
  {% endfor %}
  </ul>
</div>
{% endif %}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/toshimaru/jekyll-tagging-related_posts/issues. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
