Dir.glob(__dir__ + '/sub_specs/camera/*.rb', &method(:require))

module CameraSpecs

  include SensorSpecs #DONE
  include ImageSpecs #DONE
  include PhotographySpecs #DONE
  include OpticsAndFocusSpecs #DONE
  include VideographySpecs #Done (2?)
  include ScreenViewfinderSpecs #DONE
  include StorageSpecs #DONE
  include ConnectivitySpecs #DONE
  include OtherSpecs #DONE
  include BodySpecs #DONE
  include CameraPhysicalSpecs #DONE

  def clean_camera_specs

    @spec_type = "C"

    clean_sensor_specs || clean_image_specs || clean_photography_specs || clean_optics_and_focus_specs || clean_videography_specs || clean_screen_viewfinder_specs || clean_storage_specs || clean_connectivity_specs || clean_other_specs || clean_body_specs || clean_camera_physical_specs
  end

end
