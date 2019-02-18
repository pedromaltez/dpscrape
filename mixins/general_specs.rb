Dir.glob(__dir__ + '/sub_specs/general/*.rb', &method(:require))

module GeneralSpecs

  include PhysicalSpecs #DONE
  include PhysicalOtherSpecs #DONE

  def clean_general_specs

    @spec_type = "G"

    clean_physical_specs || clean_physical_other_specs
  end

end