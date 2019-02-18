module FocusSpecs

  def clean_focus_specs

    output = []

    if heading == "FOCUS"

      if label == "FULL TIME MANUAL" #Done

        @value = value.split("(")[0].strip
        @data_type = ["boolean", 0, 1, nil]

        if value.upcase == "YES"

          @value = boolean_value
          output << current_line

        elsif value.upcase == "NO"

          @value = boolean_value
          output << current_line

        else
  
          return []
  
        end

      elsif label == "MINIMUM FOCUS" #Done

        @label = "MFD"
        @label_raw = "Minimum focus distance (m)"

        @value = value.split("m")[0].strip

        if @sku == "2245091F"
          @value = "0.45"
        end

        @data_type = ["number", 0, 1, 2]
        output << current_line

      elsif label == "MAXIMUM MAGNIFICATION" #Done

        @value = value.gsub("×", "")
        @data_type = ["number", 0, 1, 3]
        output << current_line

      elsif label == "AUTOFOCUS" #Done

        @value = value.split("(")[0].strip
        @value = boolean_value
        @data_type = ["boolean", 0, 1, nil]
        output << current_line

      elsif label == "MOTOR TYPE" #Done

        case @value
          when "Ultrasonic" then @value = "Ultrasonic"
          when "Ring-type ultrasonic" then @value = "Ultrasonic"
          when "Stepper motor" then @value = "Stepper"
          when "Micromotor" then @value = "Micromotor"
          when "Nano ultrasonic" then @value = "Ultrasonic"
          when "Micro-type ultrasonic" then @value = "Ultrasonic"
          when "Linear Motor" then @value = "Linear"
          when "Screw drive from camera" then @value = "Screw Drive"
          when "Piezoelectric" then @value = "Piezoelectric"
        end

        case @value
          when "Ultrasonic" then @combo_code = "US"
          when "Stepper" then @combo_code = "S"
          when "Micromotor" then @combo_code = "M"
          when "Linear" then @combo_code = "L"
          when "Screw Drive" then @combo_code = "SD"
          when "Piezoelectric" then @combo_code = "P"
        end

        @data_type = ["combo", 0, 1, nil]
        output << current_line

      elsif label == "FOCUS METHOD" #Done

        @data_type = ["combo", 0, 1, nil]
        output << current_line

      elsif label == "DISTANCE SCALE" #Done

        @value = value.split("(")[0].strip
        @value = boolean_value
        @data_type = ["boolean", 0, 1, nil]
        output << current_line

      elsif label == "DOF SCALE" #Done

        @value = value.split("(")[0].strip
        @value = boolean_value
        @data_type = ["boolean", 0, 1, nil]
        output << current_line

      elsif label == "FOCUS DISTANCE LIMITER" #Done

        @value = value.split("(")[0].split(",")[0].split(";")[0].strip
        @data_type = ["boolean", 0, 1, nil]

        if value.upcase == "YES"

          @value = boolean_value
          output << current_line

        elsif value.upcase == "NO"

          @value = boolean_value
          output << current_line

        else
  
          return []
  
        end

      elsif label == "FOCUS NOTES" #Done

        return []

      end

      return output unless output.empty?

    end

  end

end
