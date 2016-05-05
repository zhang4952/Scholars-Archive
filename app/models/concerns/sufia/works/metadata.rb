module Sufia::Works
  module Metadata
    extend ActiveSupport::Concern

    included do
      property :spatial, predicate: ::RDF::DC.spatial
      property :arkivo_checksum, predicate: ::RDF::URI.new('http://scholarsphere.psu.edu/ns#arkivoChecksum'), multiple: false
      # property :nested_geo_points, :predicate => ::RDF::URI("http://www.w3.org/2003/12/exif/ns#geo"), :class_name => NestedGeoPoint
      # property :nested_geo_bbox, :predicate => ::RDF::URI("https://schema.org/box"), :class_name => NestedGeoBbox
      #
      # accepts_nested_attributes_for :nested_geo_points, :allow_destroy => true, :reject_if => :all_blank
      # accepts_nested_attributes_for :nested_geo_bbox, :allow_destroy => true, :reject_if => :all_blank
    end
  end
end
