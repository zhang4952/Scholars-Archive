# Generated via
#  `rails generate curation_concerns:work GenericWork`
class GenericWork < ActiveFedora::Base
  include ::CurationConcerns::WorkBehavior
  include ::CurationConcerns::BasicMetadata
  include Sufia::WorkBehavior

  self.human_readable_type = 'Work'
  validates :title, presence: { message: 'Your work must have a title.' }

  property :nested_geo_points, :predicate => ::RDF::URI("http://www.w3.org/2003/12/exif/ns#geo"), :class_name => NestedGeoPoint
  property :nested_geo_bbox, :predicate => ::RDF::URI("https://schema.org/box"), :class_name => NestedGeoBbox

  accepts_nested_attributes_for :nested_geo_points, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :nested_geo_bbox, :allow_destroy => true, :reject_if => :all_blank


  def to_solr(solr_doc = {})
    super.tap do |doc|
      doc[ActiveFedora.index_field_mapper.solr_name("nested_geo_points_label", :symbol)] = nested_geo_points.flat_map(&:label).select(&:present?)
      doc[ActiveFedora.index_field_mapper.solr_name("nested_geo_points_label", :stored_searchable)] = nested_geo_points.flat_map(&:label).select(&:present?)

      doc[ActiveFedora.index_field_mapper.solr_name("nested_geo_bbox_label", :symbol)] = nested_geo_bbox.flat_map(&:label).select(&:present?)
      doc[ActiveFedora.index_field_mapper.solr_name("nested_geo_bbox_label", :stored_searchable)] = nested_geo_bbox.flat_map(&:label).select(&:present?)

    end
  end
end
