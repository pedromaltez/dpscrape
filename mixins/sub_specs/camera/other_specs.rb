module OtherSpecs

  def clean_other_specs

    output = []

    if heading == "OTHER FEATURES"

      if label == "ORIENTATION SENSOR"

        @value = value.split("(")[0].strip
        @value = boolean_value
        @data_type = ["boolean", 0, 1, nil]
        output << current_line

      elsif label == "GPS"

        @data_type = ["combo", 0, 1, nil]
        output << current_line

      elsif label == "GPS NOTES"

        return []

      elsif label == "TIMELAPSE RECORDING"

        @value = value.split("(")[0].strip
        @value = boolean_value
        @data_type = ["boolean", 0, 1, nil]
        output << current_line

      end

      return output unless output.empty?

    end

  end

end
