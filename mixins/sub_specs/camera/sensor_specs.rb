module SensorSpecs

  def clean_sensor_specs

    output = []

    if heading == "SENSOR"

      if label == "SENSOR PHOTO DETECTORS" #Done

        @label_raw = "Sensor Photo Detectors (megapixels)"
        @data_type = ["number", 0, 1, 2]
        @value = value.to_s.gsub("MEGAPIXELS","").strip.to_f.round(2)
        output << current_line

      elsif label == "MAX RESOLUTION" #Done

        @combo_code = @value.gsub(" x ", "X")
        @data_type = ["combo", 0, 1, nil]
        output << current_line

      elsif label == "OTHER RESOLUTIONS" #Done

        @value = value
        .gsub("×", "x")
        .gsub("28mm: ", "")
        .gsub("; 35mm: ", ", ")
        .gsub("; 50mm: ", ", ")
        .gsub("; 16:9, 35mm (", ", ")
        .gsub(" (JPEG, 24MP)", "")
        .gsub(" (12MP)", "")
        .gsub(" (6MP)", "")
        .gsub("3:2 (", "")
        .gsub("16:9 (", "")
        .gsub("1:1 (", "")
        .gsub("4:3 (", "")
        .gsub(" (max JPEG)", "")
        .gsub("3:2, full-frame (", "")
        .gsub("APS-C (", "")
        .gsub("3:2 mode: ", "")
        .gsub("; 4:3 mode: ", ", ")
        .gsub("; 16:9 mode: ", ", ")
        .gsub("; 1:1 mode: ", ", ")
        .gsub("FX: ", "")
        .gsub("; DX crop: ", ", ")
        .gsub("; 1.2: ", ", ")
        .gsub("; 5:4: ", ", ")
        .gsub("; DX: ", ", ")
        .gsub(", 1.2x crop: ", ", ")
        .gsub("; 1.3x crop: ", ", ")
        .gsub("DX: ", "")
        .gsub(" (16:9)", "")
        .gsub(" (1:1)", "")
        .gsub(" (M-Raw)", "")
        .gsub("3,648", "3648")
        .gsub("4000, x 4000", "4000 x 4000")
        .gsub(".", ",")
        .gsub(")", "")
        .gsub(", x ", ", ")
        .gsub(" x", "x")
        .gsub("x ", "x")
        .gsub("x", " x ")
        .gsub("  ", "")
        .gsub("2976 x 1600 x 1200", "2976 x 1984, 1600 x 1080")
        .gsub("3008 x 2000 x 3008 x 1688", "3008 x 2000, 3008 x 1688")
        .gsub("2592 x 1936 x 1152 x 864", "2592 x 1936, 1152 x 864")
        .downcase
        .gsub(" x", "x")
        .gsub("x ", "x")
        .gsub("x", " x ")
        .gsub("  ", "")

        all_other_res = @value.split(",")

        @data_type = ["combo", 0, 99, nil]

        all_other_res.each do |res|
  
          @value = res.strip

          @combo_code = nil
          @current_line = nil

          @combo_code = @value.gsub(" ","").gsub("x", "X")

          output << current_line

        end

      elsif label == "IMAGE RATIO W:H" #Done

        all_ratios = @value.split(", ")

        @data_type = ["combo", 0, 99, nil]

        all_ratios.each do |ratio|

          @combo_code = nil
          @current_line = nil

          @value = ratio
          @combo_code = ratio.split(":").join("_")
          output << current_line

        end

      elsif label == "EFFECTIVE PIXELS" #Done

        @label_raw = "Effective Pixels (megapixels)"
        @data_type = ["number", 0, 1, 2]
        @value = value.to_s.gsub("MEGAPIXELS","").strip.to_f.round(2)
        output << current_line

      elsif label == "SENSOR SIZE" #Done

        @value = value.gsub('"',"″").split(" (")[0]
        .gsub("Four Thirds", "Micro Four Thirds")
        .gsub("APS-H", "APS-C")

        case value
          when "1.5″" then @combo_code = "1_5"
          when "1″" then @combo_code = "1"
          when "1/2.3″" then @combo_code = "1_2_3"
          when "1/2.33″" then @combo_code = "1_2_33"
          when "1/3.1″" then @combo_code = "1_3_1"
          when "Full frame" then @combo_code = "FF"
          when "APS-C" then @combo_code = "APSC"
          when "Medium format" then @combo_code = "MF"
          when "Micro Four Thirds" then @combo_code = "MFT"
        end

        @data_type = ["combo", 0, 1, nil]
        output << current_line

      elsif label == "SENSOR TYPE" #Done

        @data_type = ["combo", 0, 1, nil]

        if @value.include? "Foveon"
          @combo_code = "FOV"
          @value = "CMOS (Foveon X3)"
        elsif @value.include? "BSI-CMOS"
          @combo_code = "BSI"
          @value = "BSI-CMOS"
        elsif @value.include? "CMOS"
          @combo_code = "CMOS"
          @value = "CMOS"
        elsif @value.include? "CCD"
          @combo_code = "CCD"
          @value = "CCD"
        end

        output << current_line

      elsif label == "PROCESSOR" #Done

        @data_type = ["string", 0, 1, nil]
        @value = value
        .gsub("Digic","DIGIC")
        .gsub("Bionz", "BIONZ")
        .gsub("EXPEED", "Expeed")
        .gsub("DIGIC 6 (dual)", "Dual DIGIC 6")
        .gsub("X Processor Pro", "X-Processor Pro")
        .gsub("TRUE III engine", "TRUE III")
        output << current_line

      end

      return output unless output.empty?

    end

  end

end
