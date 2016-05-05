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



  # def edit
  #   curation_concern.nested_geo_bbox.each do |box|
  #     # bbox is stored as a string array of lat/long string arrays like: "121.1,121.2,44.1,44.2", however only one array of lat/long array is stored, so the first will need to be converted to simple array of strings like: ["121.1","121.2","44.1","44.2"]
  #     box_array = box.bbox.first.tr('[]" ','').split(',')
  #     box.bbox_lat_north = box_array[0]
  #     box.bbox_lon_west = box_array[1]
  #     box.bbox_lat_south = box_array[2]
  #     box.bbox_lon_east = box_array[3]
  #   end
  #   super
  # end


 # routed to /files/:id (PUT)
 def update
    params["generic_work"]["nested_geo_bbox_attributes"].each do |box, value|
      if [value["label"], value["bbox_lat_north"], value["bbox_lon_west"], value["bbox_lat_south"], value["bbox_lon_east"]].none? { |f| f.empty? }
        bbox = [value["bbox_lat_north"], value["bbox_lon_west"], value["bbox_lat_south"], value["bbox_lon_east"]]
        value["bbox"] = bbox.join(',')
      end
    end
    if actor.update(attributes_for_actor)
      after_update_response
    else
      respond_to do |wants|
        wants.html do
          build_form
          render 'edit', status: :unprocessable_entity
        end
        wants.json { render_json_response(response_type: :unprocessable_entity, options: { errors: curation_concern.errors }) }
      end
    end
 end


  # this is provided so that implementing application can override this behavior and map params to different attributes
  # def update_metadata
  #   file_attributes = form_class.model_attributes(params[:generic_work])
  #   actor.update_metadata(file_attributes)
  # end

  # routed to /files (POST)
  # def create
  #   params["generic_work"]["nested_geo_bbox_attributes"].each do |box, value|
  #     if [value["label"], value["bbox_lat_north"], value["bbox_lon_west"], value["bbox_lat_south"], value["bbox_lon_east"]].none? { |f| f.blank? }
  #       bbox = [value["bbox_lat_north"], value["bbox_lon_west"], value["bbox_lat_south"], value["bbox_lon_east"]]
  #       value["bbox"] = bbox.join(",")
  #       # params["generic_work"]["nested_geo_bbox_attributes"][box]["bbox"] = bbox.join(",")
  #     end
  #   end
  #   super
  # end


  # this is provided so that implementing application can override this behavior and map params to different attributes
  # def update_metadata
  #   params["generic_work"]["nested_geo_bbox_attributes"].each do |box, value|
  #     if [value["label"], value["bbox_lat_north"], value["bbox_lon_west"], value["bbox_lat_south"], value["bbox_lon_east"]].none? { |f| f.blank? }
  #       bbox = [value["bbox_lat_north"], value["bbox_lon_west"], value["bbox_lat_south"], value["bbox_lon_east"]]
  #       value["bbox"] = bbox.join(",")
  #       # params["generic_work"]["nested_geo_bbox_attributes"][box]["bbox"] = bbox.join(",")
  #     end
  #   end
  #   super
  # end
  #
end
