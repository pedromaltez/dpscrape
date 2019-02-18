module PhysicalOtherSpecs

  def clean_physical_other_specs

    output = []

    if heading == "OTHER"

      if label == "NOTES" #Done

        return []

      end

      return output unless output.empty?

    end

  end

end
