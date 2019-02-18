module ScreenViewfinderSpecs

  def clean_screen_viewfinder_specs

    output = []

    if heading == "SCREEN / VIEWFINDER"

      if label == "ARTICULATED LCD" #Done

        @label_raw = "Articulated Screen"
        @value = value.gsub("No", "Fixed")

        @data_type = ["combo", 0, 1, nil]
        output << current_line

      elsif label == "SCREEN SIZE" #Done

        @value = value.gsub(",","")
        @data_type = ["combo", 0, 1, nil]

        @combo_code = value.split(".").join("_")

        output << current_line

      elsif label == "SCREEN DOTS" #Done

        @value = value.gsub(",","")
        @data_type = ["number", 0, 1, 0]
        output << current_line

      elsif label == "TOUCH SCREEN" #Done

        @label_raw = "Touchscreen"

        @value = value.split("(")[0].strip
        @value = boolean_value
        @data_type = ["boolean", 0, 1, nil]
        output << current_line

      elsif label == "SCREEN TYPE" #Done

        if value.include? "LCD"
          @value = "LCD"
        elsif value.include? "TFT"
          @value = "LCD"
        elsif value.include? "WhiteMagic"
          @value = "LCD"
        elsif value.include? "OLED"
          @value = "OLED"
        end

        case @value
          when "LCD"  then @combo_code = "LCD"
          when "OLED" then @combo_code = "OLED"
        end

        @data_type = ["combo", 0, 1, nil]
        output << current_line

      elsif label == "LIVE VIEW" #Done

        @value = value.split("(")[0].strip
        @value = boolean_value
        @data_type = ["boolean", 0, 1, nil]
        output << current_line

      elsif label == "VIEWFINDER TYPE" #Done

        @data_type = ["combo", 0, 99, nil]

        @value = value
        .gsub("None", "None")
        .gsub("Electronic", "Electronic")
        .gsub("Electronic (optional)", "Electronic (optional)")
        .gsub("Optical (pentaprism)", "Optical")
        .gsub("Optical (pentamirror)", "Optical")
        .gsub("Optical (tunnel)", "Optical")
        .gsub("Optical (optional)", "Optical (optional)")
        .gsub("Optical (rangefinder)", "Optical (rangefinder)")

        case @value
          when "None" then @combo_code = "N"
          when "Electronic" then @combo_code = "E"
          when "Electronic (optional)" then @combo_code = "EO"
          when "Optical" then @combo_code = "O"
          when "Optical (optional)" then @combo_code = "OO"
          when "Optical (rangefinder)" then @combo_code = "OR"
        end

        if @value == "Electronic and Optical"

          @combo_code = "E"
          @value = "Electronic"
          output << current_line

          @current_line = nil

          @combo_code = "OR"
          @value = "Optical (rangefinder)"
          output << current_line
        else
          output << current_line
        end

      elsif label == "VIEWFINDER COVERAGE" #Done

        @combo_code = value.gsub("%","").strip

        @data_type = ["combo", 0, 1, nil]
        output << current_line

      elsif label == "VIEWFINDER MAGNIFICATION" #Done

        @value = value.split(" ")[0].gsub("×","")

        if @value == "8.1"
          return []
        end

        @combo_code = value.split(".").join("_")

        @data_type = ["combo", 0, 1, nil]
        output << current_line

      elsif label == "VIEWFINDER RESOLUTION" #Done

        @value = value.gsub(",","").to_i

        @data_type = ["number", 0, 1, 0]
        output << current_line

      end

      return output unless output.empty?

    end

  end
end
