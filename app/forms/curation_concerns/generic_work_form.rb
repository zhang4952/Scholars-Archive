# Generated via
#  `rails generate curation_concerns:work GenericWork`
module CurationConcerns
  class GenericWorkForm < Sufia::Forms::WorkForm
    self.model_class = ::GenericWork
    include HydraEditor::Form::Permissions

    # self.terms += [:resource_type, :spatial]
    self.terms += [:resource_type, :spatial, :nested_geo_points, :nested_geo_bbox]
    # self.terms = self.terms.insert(:nested_geo_points)
    # self.terms = self.terms.insert(:nested_geo_bbox)
    delegate :nested_geo_points_attributes=, :to => :solr_document
    delegate :nested_geo_bbox_attributes=, :to => :solr_document

    def initialize_fields
      # binding.pry
      model.nested_geo_points.build
      model.nested_geo_bbox.build
      super
    end

    # Fields that are in rendered terms are automatically drawn on the page.
    def secondary_terms
      super - [:nested_geo_points, :nested_geo_bbox]
    end

    def self.build_permitted_params
      permitted = super

      permitted << {
        :nested_geo_points_attributes => [
          :label,
          :latitude,
          :longitude,
          :id,
          :_destroy
        ]
      }
      permitted << {
        :nested_geo_bbox_attributes => [
          :label,
          :bbox,
          :id,
          :_destroy
        ]
      }
      permitted
    end

  end
end
