module ImageSpecs

  def clean_image_specs

    output = []

    if heading == "IMAGE"

      if label == "ISO" #Done

        @value = value.gsub("–","-").gsub(" - ","-").gsub("-"," - ")
        @value_raw = value

        @data_type = ["string", 0, 1, nil]
        output << current_line

        # split into min and max

        @current_line = nil

        @label = "MAXIMUM ISO"
        @label_raw = "Maximum ISO"

        @value = value.gsub("Auto, ","")
        @value_raw = value

        if value.include?("-")
          @value = value
          .split("-")[1]
          .split("(")[0]
          .split(",")[0]
          .split(")")[0]
          .split("in")[0]
        elsif value.include?(" to ")
          @value = value
          .split(",")[0]
          .split(" to ")[1]
        elsif value.include?("with boost")
          @value = value
          .split(",")[value.split(",").length - 2]
        else
          @value = value
          .split(",")[value.split(",").length - 1]
        end

        @value = value.strip

        @data_type = ["number", 0, 1, 0]
        output << current_line

        @current_line = nil
        @value = value_raw

        @label = "MINIMUM ISO"
        @label_raw = "Minimum ISO"

        if value.include?("-")
          @value = value
          .split("-")[0]
        elsif value.include?(" to ")
          @value = value
          .split(" to ")[0]
        else
          @value = value
          .split(",")[0]
        end

        @value = value
        .gsub("Auto","")
        .gsub("AUto,","")
        .gsub("ISO","")
        .gsub("(","")
        .strip

        @data_type = ["number", 0, 1, 0]
        output << current_line

      elsif label == "BOOSTED ISO (MINIMUM)" #Done

        @label = "MINIMUM ISO (BOOSTED)"
        @label_raw = "Minimum ISO (boosted)"
        @data_type = ["number", 0, 1, 0]
        output << current_line

      elsif label == "BOOSTED ISO (MAXIMUM)" #Done

        @label = "MAXIMUM ISO (BOOSTED)"
        @label_raw = "Maximum ISO (boosted)"
        @data_type = ["number", 0, 1, 0]
        output << current_line

      elsif label == "WHITE BALANCE PRESETS" #Done

        @label = "NUMBER OF WHITE BALANCE PRESETS"
        @label_raw = "Number of white balance presets"
        @data_type = ["number", 0, 1, 0]
        output << current_line

      elsif label == "CUSTOM WHITE BALANCE" #Done

        @value = value.split("(")[0].strip
        @value = boolean_value
        @data_type = ["boolean", 0, 1, nil]
        output << current_line

      elsif label == "IMAGE STABILIZATION" #Done

        case value
          when "No" then @combo_code = "N"
          when "Optical" then @combo_code = "O"
          when "Sensor-shift" then @combo_code = "SS"
          when "Digital only" then @combo_code = "DO"
        end

        @data_type = ["combo", 0, 1, nil]
        output << current_line

      elsif label == "UNCOMPRESSED FORMAT" #Done

        if value == "Unknown"
          return []
        end

        if value == "No" 
          @value = "None"
        end

        case value
          when "None" then @combo_code = "N"
          when "RAW" then @combo_code = "R"
          when "RAW + TIFF" then @combo_code = "RT"
        end

        @data_type = ["combo", 0, 1, nil]
        output << current_line

      elsif label == "JPEG QUALITY LEVELS" #Done

        @value = value
        .gsub("Super fine","Superfine")
        .gsub("normal", "standard")
        .gsub(")","")
        .capitalize

        @data_type = ["string", 0, 1, nil]
        output << current_line

      elsif label == "CIPA IMAGE STABILIZATION RATING" #???

        @value = value.gsub("stop(s)", "stops")

        @combo_code = value.split(" ")[0].split(".").join("_")

        @data_type = ["combo", 0, 1, nil]
        output << current_line

      elsif label == "IMAGE STABILIZATION NOTES" #Done

        return []

      end

      return output unless output.empty?

    end

  end

end
