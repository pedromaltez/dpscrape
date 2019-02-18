module LensPhysicalSpecs

  def clean_lens_physical_specs

    output = []

    if heading == "PHYSICAL"

      if label == "HOOD SUPPLIED" #Done

        @value = value.split("(")[0].strip
        @value = boolean_value
        @data_type = ["boolean", 0, 1, nil]
        output << current_line

      elsif label == "HOOD PRODUCT CODE" # Done

        return []

      elsif label == "TRIPOD COLLAR" #Done

        @value = value.split("(")[0].strip
        @value = boolean_value
        @data_type = ["boolean", 0, 1, nil]
        output << current_line

      elsif label == "FILTER THREAD" #Done

        @data_type = ["combo", 0, 1, nil]

        @combo_code = value.gsub("mm","").strip

        output << current_line

      elsif label == "FILTER NOTES" #Done

        return []

      elsif label == "POWER ZOOM" #Done

        # ignore when not yes/no
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

      elsif label == "ZOOM LOCK" #Done

        # ignore when not yes/no
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

      elsif label == "ZOOM METHOD" #Done

        @value = value
        .gsub("Rotary (internal)", "Internal (rotary)")
        .gsub("Rotary (extending)", "Extending (rotary)")
        .gsub("Push/Pull (extending)", "Extending (push/pull)")

        case value
          when "Internal (rotary)" then @combo_code = "IR"
          when "Extending (rotary)" then @combo_code = "ER"
          when "Extending (push/pull)" then @combo_code = "EP"
        end

        @data_type = ["combo", 0, 1, nil]
        output << current_line

      elsif label == "MATERIALS"

        @label = "CONSTRUCTION"
        @label_raw = "Lens Construction"
        @data_type = ["combo", 0, 99, nil]

        @value = value.downcase
        .gsub("munt", "mount")
        .gsub("mout", "mount")
        .gsub("lens barrel", "barrel")
        .gsub("body", "barrel")
        .gsub("all-metal construction", "metal")
        .gsub("aluminum", "aluminium alloy")
        .gsub("magnesium", "magnesium alloy")
        .gsub("alloy alloy", "alloy")
        .gsub("plastic and metal barrel", "plastic barrel")
        .gsub("plastic barrel with magnesium alloy sub-structure", "plastic barrel")
        .gsub("anodized aluminium alloy", "aluminium alloy barrel")
        .gsub("steel mount", "metal mount")

        case value
          when "composite" then @value = "plastic barrel"
          when "composite with metal sealed mount" then @value = "plastic barrel, metal mount"
          when "aluminium alloy" then @value = "aluminium alloy barrel"
          when "anodized" then @value = "aluminium alloy barrel"
          when "anodized aluminium" then @value = "aluminium alloy barrel"
          when "magnesium" then @value = "magnesium alloy barrel"
          when "magnesium alloy" then @value = "magnesium alloy barrel"
          when "metal mount and exterior" then @value = "metal mount, metal barrel"
          when "plastic barrel with magnesium alloy sub-structure" then @value = "plastic barrel"
          when "plastic" then @value = "plastic barrel"
          when "Plastic and metal barrel" then @value = "plastic barrel"
          when "metal" then @value = "metal barrel"
        end

        @value.split(", ").each do |material|

          @value = material.downcase.capitalize

          output << current_line

          @combo_code = nil
          @current_line = nil

        end

      end

      return output unless output.empty?

    end

  end

end
