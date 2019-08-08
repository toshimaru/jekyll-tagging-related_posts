# frozen_string_literal: true

module Jekyll
  module Tagging
    module RelatedPosts
      # Used to remove #related_posts so that it can be overridden
      def self.included(klass)
        klass.class_eval do
          remove_method :related_posts
        end
      end

      # Calculate related posts.
      # Returns [<Post>]
      def related_posts
        return [] unless docs.count > 1

        highest_freq = tag_freq.values.max
        related_scores = Hash.new(0)

        docs.each do |doc|
          doc.data["tags"].each do |tag|
            if self.data["tags"].include?(tag) && doc != self
              cat_freq = tag_freq[tag]
              related_scores[doc] += (1 + highest_freq - cat_freq)
            end
          end
        end

        sort_related_posts(related_scores)
      end

      private

      # Calculate the frequency of each tag.
      # Returns {tag => freq, tag => freq, ...}
      def tag_freq
        @tag_freq ||= docs.inject(Hash.new(0)) do |tag_freq, doc|
          doc.data["tags"].each { |tag| tag_freq[tag] += 1 }
          tag_freq
        end
      end

      # Sort the related posts in order of their score and date
      # and return just the posts
      def sort_related_posts(related_scores)
        related_scores.sort do |a, b|
          if a[1] < b[1]
            1
          elsif a[1] > b[1]
            -1
          else
            b[0].date <=> a[0].date
          end
        end.collect { |post, _freq| post }
      end

      def docs
        @docs ||= site.posts.docs
      end
    end
  end
end
