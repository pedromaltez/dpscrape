module CameraPhysicalSpecs

  def clean_camera_physical_specs

    output = []

    if heading == "PHYSICAL"

      if label == "BATTERY"

        if value == "AA"
          @combo_code = "AA"
        elsif value == "Built-in"
          @value = "Internal"
          @combo_code = "I"
          @value_raw = @value
        elsif value == "Battery Pack"
          @combo_code = "B"
        end

        @data_type = ["combo", 0, 1, nil]
        output << current_line

      elsif label == "BATTERY LIFE (CIPA)"

        @data_type = ["number", 0, 1, 0]
        output << current_line

      end

      return output unless output.empty?

    end

  end

end