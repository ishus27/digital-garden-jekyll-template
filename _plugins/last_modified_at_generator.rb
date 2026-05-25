# frozen_string_literal: true

require 'fileutils'
require 'pathname'
require 'jekyll-last-modified-at'

module Recents
  # Generate change information for all graph collections
  class Generator < Jekyll::Generator
    def generate(site)
      graph_collections = site.config['graph_collections'] || %w[notes learn easternview people]

      items = graph_collections.flat_map do |collection_name|
        site.collections[collection_name]&.docs || []
      end

      items.each do |page|
        timestamp = Jekyll::LastModifiedAt::Determinator
          .new(site.source, page.path, '%FT%T%:z')
          .to_s
        page.data['last_modified_at_timestamp'] = timestamp
      end
    end
  end
end