Dir.glob(__dir__ + '/sub_specs/lens/*.rb', &method(:require))

module LensSpecs

  include ApertureSpecs #DONE
  include FocusSpecs #DONE
  include OpticsSpecs #DONE
  include PrincipalSpecs #DONE
  include LensPhysicalSpecs #DONE

  def clean_lens_specs

    @spec_type = "L"

    clean_aperture_specs || clean_focus_specs || clean_optics_specs || clean_principal_specs || clean_lens_physical_specs
  end

end
