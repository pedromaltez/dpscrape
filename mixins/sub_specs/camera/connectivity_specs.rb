module ConnectivitySpecs

  def clean_connectivity_specs

    output = []

    if heading == "CONNECTIVITY"

      if label == "USB" #Done

        if sku.slice(1,2) == "01"

          combo_map = {
            "USB 2.0 (480 Mbit/sec)" => "2",
            "USB 3.0 (5 GBit/sec)" => "3",
            "USB 3.1 Gen 1 (5 GBit/sec)" => "3_1",
          }

          @combo_code = combo_map[value]

          @data_type = ["combo", 0, 1, nil]
          output << current_line

        end

      elsif label == "HDMI" #Done

        @label_raw = "HDMI port"
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

      elsif label == "MICROPHONE PORT" #Done

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

      elsif label == "HEADPHONE PORT" #Done

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

      elsif label == "WIRELESS" #Done

        if value == "Eye-Fi Connected"
          return []
        end

        @value = value.gsub("Built-In", "Built-in")

        @data_type = ["combo", 0, 99, nil]
        output << current_line

      elsif label == "WIRELESS NOTES" #Done

        return []

      elsif label == "REMOTE CONTROL" #Done

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

      elsif label == "USB CHARGING" #Done

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

      end

      return output unless output.empty?

    end

  end

end
