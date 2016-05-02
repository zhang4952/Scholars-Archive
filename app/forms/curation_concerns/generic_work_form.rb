# Generated via
#  `rails generate curation_concerns:work GenericWork`
module CurationConcerns
  class GenericWorkForm < Sufia::Forms::WorkForm
    self.model_class = ::GenericWork
    include HydraEditor::Form::Permissions
    self.terms += [:resource_type]
    self.terms = self.terms.insert(2, :nested_geo_points)
    delegate :nested_geo_points_attributes=, :to => :model
  end
end
