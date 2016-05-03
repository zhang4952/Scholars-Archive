# Generated via
#  `rails generate curation_concerns:work GenericWork`
module CurationConcerns
  class GenericWorkForm < Sufia::Forms::WorkForm
    self.model_class = ::GenericWork
    include HydraEditor::Form::Permissions
    self.terms += [:resource_type, :spatial]
    self.terms = self.terms.insert(2, :nested_geo_points, :nested_geo_bbox)
    delegate :nested_geo_points_attributes=, :to => :model
    delegate :nested_geo_bbox_attributes=, :to => :model

    def initialize_fields
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
          :id,
          :_destroy,
          :label,
          :latitude,
          :longitude
        ]
      }
      permitted << {
        :nested_geo_bbox_attributes => [
          :id,
          :_destroy,
          :label,
          :bbox,
        ]
      }

      permitted
    end

  end
end
