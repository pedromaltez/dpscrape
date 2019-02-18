module OpticsAndFocusSpecs

  def clean_optics_and_focus_specs

    output = []

    if heading == "OPTICS & FOCUS"

      if label == "AUTOFOCUS" #Done

        @label_raw = "Autofocus modes"
        @data_type = ["combo", 0, 99, nil]

        @value = value
        .gsub("Multi-area", "Multi Area")
        .gsub("Selective single-point", "Selective Single Point")
        .gsub("Center", "Centre")
        .gsub("Contrast Detect (sensor)", "Contrast Detect")

        case @value
          when "Contrast Detect" then @combo_code = "CD"
          when "Phase Detect" then @combo_code = "PD"
          when "Multi Area" then @combo_code = "MA"
          when "Centre" then @combo_code = "C"
          when "Selective Single Point" then @combo_code = "SSP"
          when "Tracking" then @combo_code = "T"
          when "Single" then @combo_code = "S"
          when "Continuous" then @combo_code = "CONT"
          when "Touch" then @combo_code = "TOUCH"
          when "Face Detection" then @combo_code = "FD"
          when "Live View" then @combo_code = "LV"
        end

        output << current_line

      elsif label == "NUMBER OF FOCUS POINTS" #Done

        @data_type = ["number", 0, 1, 0]
        output << current_line

      elsif label == "LENS MOUNT" #Done

        @value = value
        .gsub("Canon EF/EF-S", "Canon EF-S")
        .gsub("Pentax KAF2", "Pentax K")
        .gsub("Pentax KAF4", "Pentax K")
        .gsub("Pentax 645AF2", "Pentax 645")
        .gsub("Sony/Minolta Alpha", "Sony Alpha")
        .gsub("Sigma SA Bayonet", "Sigma SA")

        case value
          when "Canon EF" then @combo_code = "CEF"
          when "Canon EF-S" then @combo_code = "CEFS"
          when "Canon EF-M" then @combo_code = "CEFM"
          when "Fujifilm X" then @combo_code = "FX"
          when "Nikon F" then @combo_code = "NF"
          when "Micro Four Thirds" then @combo_code = "MFT"
          when "Pentax K" then @combo_code = "PK"
          when "Pentax 645" then @combo_code = "P645"
          when "Sony E" then @combo_code = "SE"
          when "Sony Alpha" then @combo_code = "SA"
          when "Sigma SA" then @combo_code = "SSA"
          when "Hasselblad X" then @combo_code = "HX"
          when "Leica L" then @combo_code = "L"
          when "Leica M" then @combo_code = "LM"
        end

        @data_type = ["combo", 0, 1, nil]
        output << current_line

      elsif label == "FOCAL LENGTH MULTIPLIER" #Done

        @value = value.gsub("×","").to_f().round(2)
        @data_type = ["number", 0, 1, 2]
        output << current_line

      elsif label == "FOCAL LENGTH (EQUIV.)" #Done

        @label = "FOCAL LENGTH (EQUIV)"

        @value = value.gsub("–", " - ")

        @data_type = ["string", 0, 1, nil]
        output << current_line

      elsif label == "OPTICAL ZOOM" #Done

        @label_raw = "Optical zoom multiplier"
        @value = value.gsub("×","").to_f().round(1)
        @data_type = ["number", 0, 1, 1]
        output << current_line

      elsif label == "MAXIMUM APERTURE" #Done

        @value = value.split("–")[0].gsub("F","")
        @data_type = ["number", 0, 1, 2]
        output << current_line

      elsif label == "DIGITAL ZOOM" #Done

        @value = value.gsub("X","x").gsub("x-", "x - ")

        @value = value.split("(")[0].strip
        @value = boolean_value

        @data_type = ["boolean", 0, 1, nil]
        output << current_line

      elsif label == "NORMAL FOCUS RANGE" #Done

        @label = "MFD"
        @label_raw = "Minimum focus distance (cm)"

        @value = value.split("cm")[0].strip

        @data_type = ["number", 0, 1, 0]
        output << current_line

      elsif label == "MACRO FOCUS RANGE" #Done

        @label = "MFD_MACRO"
        @label_raw = "Minimum macro focus distance (cm)"

        @value = value.split("cm")[0].strip

        @data_type = ["number", 0, 1, 0]
        output << current_line

      elsif label == "NUMBER OF CROSS-TYPE FOCUS POINTS"

        return []

      elsif label == "FIELD OF VIEW"

        return []

      elsif label == "NUMBER OF LENSES"

        return []

      elsif label == "MANUAL FOCUS" #Done

        @value = value.split("(")[0].strip
        @value = boolean_value
        @data_type = ["boolean", 0, 1, nil]
        output << current_line

      end

      return output unless output.empty?

    end

  end

end
