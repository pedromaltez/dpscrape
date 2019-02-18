module ApertureSpecs

  def clean_aperture_specs

    output = []

    if heading == "APERTURE"

      if label == "MINIMUM APERTURE" || label == "MAXIMUM APERTURE"
        @value = value.gsub("F", "f/").gsub("–", " - ")
        @value_raw = value
      end

      if label == "MINIMUM APERTURE" #Done

        @label = "MINIMUM APERTURE (TEXT)"
        @label_raw = "Minimum aperture (text)"

        case value
          when "3240085E" then @value = "f/16"
          when "3240224K" then @value = "f/29"
          when "3240449K" then @value = "f/32 - 40"
          when "7240696E" then @value = "f/22"
          when "7240697E" then @value = "f/22"
          when "9242101C" then @value = "f/22"
          when "9242101N" then @value = "f/22"
          when "P241306T" then @value = "f/22"
        end

        @combo_code = value.gsub("f/","").gsub(" - ", "_").gsub(".","_")

        @data_type = ["combo", 0, 1, nil]
        output << current_line

        @current_line = nil

        @label  = "MINIMUM APERTURE (NUMBER)"
        @label_raw  = "Minimum aperture (number)"
        @value = value.gsub("f/", "")

        if value.include?("-")
          @value = value.split(" - ")[1]
        end

        @data_type = ["number", 0, 1, 2]
        output << current_line

      elsif label == "MAXIMUM APERTURE" #Done

        @label = "MAXIMUM APERTURE (TEXT)"
        @label_raw = "Maximum aperture (text)"

        case value
          when "3240085E" then @value = "f/1.4"
          when "3240224K" then @value = "f/3.5 - 4.5"
          when "3240449K" then @value = "f/4.5 - 5.6"
          when "7240696E" then @value = "f/2.8"
          when "7240697E" then @value = "f/4"
          when "9242101C" then @value = "f/2.8"
          when "9242101N" then @value = "f/2.8"
          when "P241306T" then @value = "f/2.8 - 4"
        end

        @combo_code = value.gsub("f/","").gsub(" - ", "_").gsub(".","_")

        @data_type = ["combo", 0, 1, nil]
        output << current_line

        @current_line = nil

        @label = "MAXIMUM APERTURE (NUMBER)"
        @label_raw = "Maximum aperture (number)"
        @value = value.gsub("f/", "")

        if value.include?("-")
          @value = value.split(" - ")[0]
        end

        @data_type = ["number", 0, 1, 2]
        output << current_line

        @current_line = nil

        @label = "CONSTANT APERTURE"
        @label_raw = "Constant Aperture"
        @data_type = ["boolean", 0, 1, nil]

        if value_raw.include?("-")
          @value = 0
          output << current_line
        else
          @value = 1
          output << current_line
        end

      elsif label == "NUMBER OF DIAPHRAGM BLADES" #Done

        @data_type = ["number", 0, 1, 0]
        output << current_line

      elsif label == "APERTURE RING" #Done

        @value = value.split("(")[0].strip
        @value = boolean_value
        @data_type = ["boolean", 0, 1, nil]
        output << current_line

      elsif label == "APERTURE NOTES"

        return []

      end

      return output unless output.empty?

    end

  end

end
