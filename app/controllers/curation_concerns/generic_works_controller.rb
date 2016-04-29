# Generated via
#  `rails generate curation_concerns:work GenericWork`

class CurationConcerns::GenericWorksController < ApplicationController
  include CurationConcerns::CurationConcernController
  # Adds Sufia behaviors to the controller.
  include Sufia::WorksControllerBehavior

  self.curation_concern_type = GenericWork

  def new
    curation_concern.depositor = current_user.user_key
    super
  end

  # Override the default behavior from curation_concerns in order to add uploaded_files to the parameters received by the actor.
  def attributes_for_actor
    super
  end
end
