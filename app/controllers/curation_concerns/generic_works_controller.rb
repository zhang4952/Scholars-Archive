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

  def edit
    curation_concern.nested_geo_bbox.each do |box|
      # bbox is stored as a string array of lat/long string arrays like: "121.1,121.2,44.1,44.2", however only one array of lat/long array is stored, so the first will need to be converted to simple array of strings like: ["121.1","121.2","44.1","44.2"]
      box_array = box.bbox.first.tr('[]" ','').split(',')
      box.bbox_lat_north = box_array[0]
      box.bbox_lon_west = box_array[1]
      box.bbox_lat_south = box_array[2]
      box.bbox_lon_east = box_array[3]
    end
    super
  end

  # Override the default behavior from curation_concerns in order to add uploaded_files to the parameters received by the actor.
  def attributes_for_actor
    attributes = super
    params["generic_work"]["nested_geo_bbox_attributes"].each do |box, value|
      if [value["label"], value["bbox_lat_north"], value["bbox_lon_west"], value["bbox_lat_south"], value["bbox_lon_east"]].none? { |f| f.blank? }
        bbox = [value["bbox_lat_north"], value["bbox_lon_west"], value["bbox_lat_south"], value["bbox_lon_east"]]
        attributes["nested_geo_bbox_attributes"][box]["bbox"] = bbox.join(",")
      end
    end
    attributes
  end
end
