module OpticsSpecs

  def clean_optics_specs

    output = []

    if heading == "OPTICS"

      if label == "ELEMENTS" #Done

        @data_type = ["number", 0, 1, 0]
        output << current_line

      elsif label == "GROUPS" #Done

        @data_type = ["number", 0, 1, 0]
        output << current_line

      elsif label == "SPECIAL ELEMENTS / COATINGS" #Done

        @data_type = ["string", 0, 1, nil]
        output << current_line

      end

      return output unless output.empty?

    end

  end

end

