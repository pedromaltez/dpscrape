Dir.glob(__dir__ + '/sub_specs/printer/*.rb', &method(:require))

module PrinterSpecs

  def clean_printer_specs #DONE

    @spec_type = "P"

    output = []

    if heading == "PRINTER" #Done

      if label == "COLOR TECHNOLOGY" #Done

        @label_raw = "Colour technology"
        @data_type = ["combo", 0, 1, nil]
        output << current_line

      elsif label == "MAX COLOR RESOLUTION" #Done

        @combo_code = "4800X2400"

        @label_raw = "Max colour resolution"
        @data_type = ["combo", 0, 1, nil]
        output << current_line

      elsif label == "MAX B/W RESOLUTION" #Done

        @combo_code = "4800X2400"

        @data_type = ["combo", 0, 1, nil]
        output << current_line

      elsif label == "DROPLET SIZE" #Done

        @value = value.gsub("pl", "pL")

        @combo_code = value.gsub("pL", "").strip

        @data_type = ["combo", 0, 1, nil]
        output << current_line

      elsif label == "PHOTO PRINT SPEED" #Done

        @value = value
        .gsub('"','″')

        @data_type = ["string", 0, 1, nil]
        output << current_line

      elsif label == "INKS" #Done

        @data_type = ["string", 0, 1, nil]
        output << current_line

      elsif label == "INK TYPE" #Done

        @value = value.gsub("Pigment-based", "Pigment Based")
        @combo_code = "PGB"

        @data_type = ["combo", 0, 1, nil]
        output << current_line

      end

      return output unless output.empty?

    end

    if heading == "CONNECTIVITY" #Done

      if label == "USB" #Done

        if sku.slice(1,2) == "16"

          @value.gsub("USB 2.0 (480Mbit/sec)", "USB 2.0 (480 Mbit/sec)")

          combo_map = {
            "USB 2.0 (480 Mbit/sec)" => "2",
            "USB 3.0 (5 GBit/sec)" => "3",
            "USB 3.1 Gen 1 (5 GBit/sec)" => "3_1",
          }

          @combo_code = combo_map[value]

          @data_type = ["combo", 0, 1, nil]
          output << current_line

        end

      elsif label == "DIRECT PRINTING" #Done

        @data_type = ["boolean", 0, 1, nil]

        @value = value.split("(")[0].strip

        if value.upcase == "YES"

          @value = boolean_value
          output << current_line

        elsif value.upcase == "NO"

          @value = boolean_value
          output << current_line

        else
  
          return []
  
        end

      elsif label == "WI-FI" #Done

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

      elsif label == "VOICE ENABLED" #Done

        return []

      elsif label == "ETHERNET" #Done

        case value
          when "Yes (10/100)" then @combo_code = "100"
        end

        @data_type = ["combo", 0, 1, nil]
        output << current_line

      elsif label == "BLUETOOTH" #Done

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

      elsif label == "MEMORY CARD SUPPORT" #Done

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

      elsif label == "OPERATING SYSTEM" #Done

        @value = value.gsub("(and above)", "").strip

        combo_map = {
          "Max OS X - 10.4" => "MAC_10_4",
          "Max OS X - 10.5" => "MAC_10_5",
          "Max OS X - 10.6" => "MAC_10_6",
          "Windows 7 (32-bit)" => "WIN_7_32",
          "Windows 7 (64-bit)" => "WIN_7_64",
          "Windows Vista (32-bit)" => "WIN_V_32",
          "Windows Vista (64-bit)" => "WIN_V_64",
          "Windows XP (32-bit)" => "WIN_XP_32",
          "Windows XP (64-bit)" => "WIN_XP_64"
        }

        @combo_code = combo_map[value]

        @data_type = ["combo", 0, 99, nil]
        output << current_line

      end

      return output unless output.empty?

    end

    if heading == "PAPER HANDLING" #Done

      if label == "MAX DOCUMENT SIZE" #Done

        case value
          when '13" x 19"' then @combo_code = "I13X19"
        end

        @data_type = ["combo", 0, 1, nil]
        output << current_line

      elsif label == "FIXED PAPER SIZE" #Done

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

      elsif label == "SUPPORTED MEDIA" #Done

        @value = value
        .gsub('"','″')
        .gsub("4 x 6 in", "4″ x 6″")
        .gsub("5 x 7 in", "5″ x 7″")
        .gsub("8 x 10 in", "8″ x 10″")
        .gsub("13″x 19″", "13″ x 19″")
        .gsub("Standard No.10 envelopes", "No. 10 Envelope")

        all_media = value.split(",")

        @data_type = ["combo", 0, 99, nil]

        all_media.each do |media|

          @value = media.strip.capitalize.gsub("No. 10 envelope", "No. 10 Envelope")

          case value
            when "4″ x 6″" then @combo_code = "I4X6"
            when "5″ x 7″" then @combo_code = "I5X7"
            when "8″ x 10″" then @combo_code = "I8X10"
            when "13″x 19″" then @combo_code = "I13X19"
            when "A3" then @combo_code = "A3"
            when "Letter" then @combo_code = "LT"
            when "Legal" then @combo_code = "LG"
            when "No. 10 Envelope" then @combo_code = "ENV10"
          end

          output << current_line

          @combo_code = nil
          @current_line = nil

        end

      elsif label == "FEEDER CAPACITY" #Done

        @data_type = ["number", 0, 1, 0]
        output << current_line

      elsif label == "NUMBER OF TRAYS" #Done

        @data_type = ["number", 0, 1, 0]
        output << current_line

      elsif label == "AUTO DUPLEX / DOUBLE SIDED PRINTING" #Done

        @data_type = ["boolean", 0, 1, nil]
        @label_raw = "Duplex printing"

        if value.upcase == "YES"

          @value = boolean_value
          output << current_line

        elsif value.upcase == "NO"

          @value = boolean_value
          output << current_line

        else
  
          return []
  
        end

      elsif label == "BORDERLESS PRINTING" #Done

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

      elsif label == "COLOR MANAGEMENT" #Done

        @label_raw = "Colour management"
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

    if heading == "GENERAL" #Done

      if label == "PRINTER TYPE" #Done

        @label = "TYPE"
        @label_raw = "Printer Type"

        @data_type = ["combo", 0, 1, nil]
        output << current_line

      end

      return output unless output.empty?

    end

    if heading == "PHYSICAL" #Done

      if label == "DISPLAY - TOUCHSCREEN" #Done

        @label = "TOUCHSCREEN"
        @label_raw = "Touchscreen"

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

      elsif label == "BATTERIES" #Done

        @label = "BATTERY POWERED"
        @label_raw = "Battery Powered"
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
