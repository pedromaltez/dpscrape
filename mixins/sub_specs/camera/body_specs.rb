module BodySpecs

  def clean_body_specs

    output = []

    if heading == "BODY TYPE"

      if label == "BODY TYPE"
        @label_new = "TYPE"
        @label_raw = "Camera Type"
        @data_type = ["combo", 0, 1, nil]

        if value == "Large SLR"
          @value = "DSLR"
          @value_raw = @value
        elsif value == "Mid-size SLR"
          @value = "DSLR"
          @value_raw = @value
        elsif value == "Compact SLR"
          @value = "DSLR"
          @value_raw = @value
        elsif value == "SLR-like (bridge)"
          @value = "Bridge"
          @value_raw = @value
        elsif value == "Large sensor compact"
          @value = "Compact"
          @value_raw = @value
        elsif value == "Ultracompact"
          @value = "Compact"
          @value_raw = @value
        elsif value == "Rangefinder-style mirrorless"
          @value = "Mirrorless"
          @value_raw = @value
        elsif value == "SLR-style mirrorless"
          @value = "Mirrorless"
          @value_raw = @value
        elsif value == "VR/Action camera"
          @value = "Action"
          @value_raw = @value
        end

        output << current_line

      end

      return output unless output.empty?

    end

  end

end
