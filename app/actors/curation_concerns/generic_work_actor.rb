# Generated via
#  `rails generate curation_concerns:work GenericWork`
module CurationConcerns
  class GenericWorkActor < CurationConcerns::BaseActor

    def update(attributes)
      # binding.pry
      # attributes.delete(:cloud_resources.to_s)


      # apply_update_data_to_curation_concern
      # apply_save_data_to_curation_concern(attributes)
      # next_actor.update(attributes) && save && run_callbacks(:after_update_metadata)
      super
    end
  end
end
