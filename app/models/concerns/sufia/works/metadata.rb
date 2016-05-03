module Sufia::Works
  module Metadata
    extend ActiveSupport::Concern

    included do
      property :spatial, predicate: ::RDF::DC.spatial
      property :arkivo_checksum, predicate: ::RDF::URI.new('http://scholarsphere.psu.edu/ns#arkivoChecksum'), multiple: false
      # property :nested_geo_points, :predicate => ::RDF::URI("http://www.w3.org/2003/12/exif/ns#geo"), :class_name => NestedGeoPoint
      property :nested_geo_points, :predicate => ::RDF::URI("http://www.w3.org/2003/12/exif/ns#geo")
    end
  end
end
