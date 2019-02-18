module VideographySpecs

  def clean_videography_specs

    output = []

    if heading == "VIDEOGRAPHY FEATURES"

      if label == "RESOLUTIONS"

        @label = "VIDEO MODES"
        @label_raw = "Video Modes - Resolutions"
        @data_type = ["combo", 0, 99, nil]

        output << current_line

        # @value = value
        # .gsub(" x ", "x")
        # .gsub("x ", "x")
        # .gsub(" x", "x")
        # .gsub("x", " x ")
        # .gsub("4K (3840 x 2160 @ 30p/24p [60-100Mbps])", "3840 x 2160 (30p, 24p)")
        # .gsub("4K (UHD) 30p/25p/24p", "3840 x 2160 (30p, 25p, 24p)")
        # .gsub("4K (3840 x 2160 @ 30p/24p)", "3840 x 2160 (30p, 24p)")
        # .gsub("4K/UHD (3840 x 2160 @ 30p/24p)", "3840 x 2160 (30p, 24p)")
        # .gsub("1080/60p/50p/30p/25p/24p", "1920 x 1080 (60p, 50p, 30p, 25p, 24p)")
        # .gsub("Full HD (1920 x 1080 @ 120p/60p/60i/30p/24p [50-100Mbps])", "1920 x 1080 (120p, 60p, 60i, 30p, 24p)")
        # .gsub("720/60p/50p", "1280 x 720 (60p, 50p)")
        # .gsub("720p (30p [16Mbps])", "1280 x 720 (30p)")
        # .gsub("320 x 240 (30 )", "320 x 240 (30p)")
        # .gsub("640 x 480 (30 )", "640 x 480 (30p)")
        # .gsub("640 x 480 (25 )", "640 x 480 (25p)")
        # .gsub("640 x 480 (24 )", "640 x 480 (24p)")
        # .gsub("640 x 424 (30,25,24 )", "640 x 424 (30p, 25p, 24p)")
        # .gsub("1280 x 720 (60,50,30,25,24 )", "1280 x 720 (60p, 50p, 30p, 25p, 24p)")
        # .gsub("1280 x 720 (30 )", "1280 x 720 (30p)")
        # .gsub("1280 x 720 (60, 30 )", "1280 x 720 (60p, 30p)")
        # .gsub("1280 x 720 (25, 24 )", "1280 x 720 (25p, 24p)")
        # .gsub("1280 x 720 (60p, 50p, 30p, 25p) 640 x 480 (30p, 25p)", "1280 x 720 (60p, 50p, 30p, 25p), 640 x 480 (30p, 25p)")
        # .gsub("1440 x 1080 (30 ),", "1440 x 1080 (30p)")
        # .gsub("1920 x 1080 (60 )", "1920 x 1080 (60p)")
        # .gsub("1920 x 1080 (25,24 )", "1920 x 1080 (25p, 24p)")
        # .gsub("1920 x 1080 (30,25,24 )", "1920 x 1080 (30p, 25p, 24p)")
        # .gsub("XAVC S 1080/60p(50Mbps), 30p (50Mbps), 24p (50Mbps). 720 120p (50Mbps). AVCHD 60p (28Mbps), 60i (24Mbps/17Mbps), 24p (24Mbps/17Mbps)", "1920 x 1080 (60p, 30p, 24p), 1280 x 720 (60p, 60i, 24p)")
        # .gsub("3840 x 2160 (30, 25, 24, 20) 1920 x 1080 (60, 50, 30, 25) 1280 x 720 (60, 50, 30, 25), 640 x 480 (30, 25 )", "3840 x 2160 (30p, 25p, 24p, 20p), 1920 x 1080 (60p, 50p, 30p, 25p), 1280 x 720 (60p, 50p, 30p, 25p), 640 x 480 (30p, 25p)")
        # .gsub("50.", "50,")
        # .gsub("fps", "")
        # .gsub("p/", "p, ")
        # .gsub("i/", "i, ")
        # .gsub("1280 x 720 (25 )", "1280 x 720 (25p)")
        # .gsub("1280 x 720 (25, 24 )", "1280 x 720 (25p, 24p)")
        # .gsub("1280 x 720 (30 )", "1280 x 720 (30p)")
        # .gsub("1280 x 720 (59.94, 50 )", "1280 x 720 (59.94p, 50p)")
        # .gsub("1280 x 720 (59.94, 50, 29.97, 25 )", "1280 x 720 (59.94p, 50p, 29.97p, 25p)")
        # .gsub("1280 x 720 (60, 30 )", "1280 x 720 (60p, 30p)")
        # .gsub("1280 x 720 (60, 50 )", "1280 x 720 (60p, 50p)")
        # .gsub("1280 x 720 (60, 50, 30, 25 )", "1280 x 720 (60p, 50p, 30p, 25p)")
        # .gsub("1280 x 720 (60,50 )", "1280 x 720 (60p, 50p)")
        # .gsub("1280 x 720 (60,50,30,25,24 )", "1280 x 720 (60p, 50p, 30p, 25p, 24p)")
        # .gsub("1440 x 1080 (25 )", "1440 x 1080 (25p)")
        # .gsub("1440 x 1080 (30 )", "1440 x 1080 (30p)")
        # .gsub("1440 x 1080 (30, 25 )", "1440 x 1080 (30p, 25p)")
        # .gsub("1440 x 1080 (50, 25)", "1440 x 1080 (50p, 25p)")
        # .gsub("1920 x 1080 (25,24 )", "1920 x 1080 (25p, 24p)")
        # .gsub("1920 x 1080 (29.97, 25, 23.976 )", "1920 x 1080 (29.97p, 25p, 23.976p )")
        # .gsub("1920 x 1080 (30, 25, 24 )", "1920 x 1080 (30p, 25p, 24p)")
        # .gsub("1920 x 1080 (30,25,24 )", "1920 x 1080 (30p, 25p, 24p)")
        # .gsub("1920 x 1080 (50 )", "1920 x 1080 (50p)")
        # .gsub("1920 x 1080 (59.94, 50, 29.97, 25, 24, 23.98 )", "1920 x 1080 (59.94p, 50p, 29.97p, 25p, 24p, 23.98p)")
        # .gsub("1920 x 1080 (60 )", "1920 x 1080 (60p)")
        # .gsub("1920 x 1080 (60, 50, 25, 24 )", "1920 x 1080 (60p, 50p, 25p, 24p)")
        # .gsub("1920 x 1080 (60, 50, 30, 25, 24 )", "1920 x 1080 (60p, 50p, 30p, 25p, 24p)")
        # .gsub("320 x 240 (30 )", "320 x 240 (30p)")
        # .gsub("640 x 424 (24 )", "640 x 424 (24p)")
        # .gsub("640 x 424 (30, 25 )", "640 x 424 (30p, 25p)")
        # .gsub("640 x 424 (30,25,24 )", "640 x 424 (30p, 25p ,24p)")
        # .gsub("640 x 480 (25 )", "640 x 480 (25p)")
        # .gsub("640 x 480 (25, 30 )", "640 x 480 (25p, 30p)")
        # .gsub("640 x 480 (29.97, 25 )", "640 x 480 (29.97p, 25p)")
        # .gsub("640 x 480 (30 )", "640 x 480 (30p)")
        # .gsub("640 x 480 (30 )", "640 x 480 (30p)")
        # .gsub("640 x 480 (30, 25 )", "640 x 480 (30p, 25p)")

        # case @sku
        #   when "P016208G" then @value = "3840 x 2160 (30p, 25p, 24p, 20p), 1920 x 1080 (60p, 50p, 30p, 25p), 1280 x 720 (60p, 50p, 30p, 25p)"
        #   when "P016208V" then @value = "3840 x 2160 (30p, 25p, 24p, 20p), 1920 x 1080 (60p, 50p, 30p, 25p), 1280 x 720 (60p, 50p, 30p, 25p)"
        #   when "P016209K" then @value = "3840 x 2160 (30p, 25p, 24p, 20p), 1920 x 1080 (60p, 50p, 30p, 25p), 1280 x 720 (60p, 50p, 30p, 25p)"
        #   when "P012490K" then @value = "3840 x 2160 (30p, 24p), 1920 x 1080 (60p, 60i, 30p, 24p), 640 x 480 (30p)"
        #   when "P012490S" then @value = "3840 x 2160 (30p, 24p), 1920 x 1080 (60p, 60i, 30p, 24p), 640 x 480 (30p)"
        #   # .gsub("3840 x 2160 (30p, 24p), 1920 x 1080 @ 60p, 60i, 30p, 24p, 640 x 480 (30p)", "3840 x 2160 (30p, 24p), 1920 x 1080 (60p, 60i, 30p, 24p), 640 x 480 (30p)")
        #   when "7010365K" then @value = "1920 x 1080 (60p, 60i), 1440 x 1080 (30p), 640 x 480 (30p)"
        #   # .gsub("VCHD: 28M PS(1,920 x 1,080/60p) / 24M FX(1,920 x 1,080/60i) / 17M FH(1,920 x 1,080/60i),MP4: 12M(1,440 x 1,080/30) / 3M VGA(640 x 480/30)", "1920 x 1080 (60p, 60i), 1440 x 1080 (30p), 640 x 480 (30p)")
        # end

        # # .gsub("1920 x 1080 (60p) 1920 x 1080 (60i) 1920 x 1080 (60i),MP4: 12M(1,440 x 1,080/30) / 3M VGA(640 x 480/30)", "1920 x 1080 (60p, 60i), ")
        # # .gsub("XAVC S 1080/60p(50Mbps)", "1920 x 1080 (60p)")
        # # .gsub("MP4: 12M(1,440 x 1,080/30)", "1440 x 1080 (30p)")
        # # .gsub("VCHD: 28M PS(1,920 x 1,080/60p)", "1920 x 1080 (60p)")
        # # .gsub("/ 24M FX(1,920 x 1,080/60i)", "1920 x 1080 (60i)")
        # # .gsub("/ 17M FH(1,920 x 1,080/60i)", "1920 x 1080 (60i)")
        # # .gsub("MP4: 12M(1,440 x 1,080/30)", "1440 x 1080 (30p)")
        # # .gsub("/ 3M VGA(640 x 480/30)", "640 x 480 (60p)")





        # split_video_modes = @value.split("),")

        # split_video_modes.each do |mode|

        #   if mode.include? "("
        #     @value = "#{mode.strip})".gsub("))", ")")
        #   else
        #     @value = mode.strip
        #   end

        #   output << current_line

        #   @combo_code = nil
        #   @current_line = nil

        # end


        # case @sku
        #   # when "7015190K" then @value = "1920 x 1080 (60i, 30p, 24p), 1440 x 1080, 640 x 480"
        #   # when "7015192V" then @value = "1440 x 1080, 640 x 480, 1920 x 1080 (60i, 30p, 24p)"
        # end

        # all_video_modes = @value.split("),")

        # all_video_modes.each do |mode|
        #   if mode.include? "("
        #     @value = "#{mode})".strip
        #   else
        #     @value = mode.strip
        #   end

        #   inner_all_video_modes = @value.split(") ")

        #   inner_all_video_modes.each do |inner_mode|
        #     if inner_mode.include? "("
        #       @value = "#{inner_mode})".gsub("))",")").gsub("))",")").strip

        #       @combo_code = @value.strip
        #       .gsub("4096 x 2160" ,"D4K")
        #       .gsub("4096 x 2160" ,"D4K")
        #       .gsub("3840 x 2160" ,"4K")
        #       .gsub("1920 x 1080" ,"FHD")
        #       .gsub("1280 x 720" ,"HD")
        #       .gsub("23.98","23")
        #       .gsub("p ","P")
        #       .gsub("p, ","P")
        #       .gsub("i ","I")
        #       .gsub("i, ", "I")
        #       .gsub("/ ","")
        #       .gsub(" Mbps, ","")
        #       .gsub("MP4, ","M")
        #       .gsub("MOV, ", "V")
        #       .gsub("XAVC S, ","X")
        #       .gsub("AVCHD, ","A")
        #       .gsub("MTS, ","T")
        #       .gsub("H.264, ","H")
        #       .gsub("Linear PCM", "L")
        #       .gsub("AAC","A")
        #       .gsub("Dolby Digital","D")
        #       .gsub(" ","")
        #       .strip

        #     else
        #       @combo_code = @value.strip.upcase.gsub(" ", "")
        #       @value = inner_mode.strip
        #     end



        #   end
        # end

        # INSERT VIDEO MODE CATEGORIES (4k, HD, FHD, SD, etc.)

        # @combo_code = nil
        # @current_line = nil

        # @value = @value_raw

        # @label = "VIDEO MODE CATEGORIES"
        # @label_raw  = "Video Mode Categories"
        # @data_type = ["combo", 0, 99, nil]

        # if @value.include? "4096 x 2160"
        #   @combo_code = nil
        #   @current_line = nil
        #   @combo_code = "D4K"
        #   @value = "DCI 4K"
        #   output << current_line
        # end
        # if @value.include? "3840 x 2160"
        #   @combo_code = nil
        #   @current_line = nil
        #   @combo_code = "4K"
        #   @value = "4K UHD"
        #   output << current_line
        # end
        # if @value.include? "4K (UHD)"
        #   @combo_code = nil
        #   @current_line = nil
        #   @combo_code = "4K"
        #   @value = "4K UHD"
        #   output << current_line
        # end
        # if @value.include? "1920 x 1080"
        #   @combo_code = nil
        #   @current_line = nil
        #   @combo_code = "FHD"
        #   @value = "Full HD"
        #   output << current_line
        # end
        # if @value.include? "1080p"
        #   @combo_code = nil
        #   @current_line = nil
        #   @combo_code = "FHD"
        #   @value = "Full HD"
        #   output << current_line
        # end
        # if @value.include? "1280 x 720"
        #   @combo_code = nil
        #   @current_line = nil
        #   @combo_code = "HD"
        #   @value = "HD"
        #   output << current_line
        # end
        # if @value.include? "720p"
        #   @combo_code = nil
        #   @current_line = nil
        #   @combo_code = "HD"
        #   @value = "HD"
        #   output << current_line
        # end
        # if @value.include? "640 x 480"
        #   @combo_code = nil
        #   @current_line = nil
        #   @combo_code = "SD"
        #   @value = "SD"
        #   output << current_line
        # end
        # if @value.include? "640 x 424"
        #   @combo_code = nil
        #   @current_line = nil
        #   @combo_code = "SD"
        #   @value = "SD"
        #   output << current_line
        # end
        # if @value.include? "320 x 240"
        #   @combo_code = nil
        #   @current_line = nil
        #   @combo_code = "SD"
        #   @value = "SD"
        #   output << current_line
        # end

      elsif label == "FORMAT" #Done

        @label = "VIDEO FORMATS"
        @label_raw = "Video Formats"
        @data_type = ["combo", 0, 99, nil]

        value.split(", ").each do |format|
          @value = format

          @combo_code = nil
          @current_line = nil

          case value
            when "H.264" then @combo_code = "H264"
            when "H.265" then @combo_code = "H265"
            when "MPEG-4" then @combo_code = "MPEG4"
            when "AVCHD" then @combo_code = "AVCHD"
            when "XAVC S" then @combo_code = "XAVCS"
            when "Motion JPEG" then @combo_code = "MJPG"
          end

          output << current_line
        end

      elsif label == "MICROPHONE" #Done

        case value
          when "Mono" then @combo_code = "M"
          when "Multiple" then @combo_code = "X"
        end

        @data_type = ["combo", 0, 1, nil]
        output << current_line

      elsif label == "SPEAKER" #Done

        @data_type = ["combo", 0, 1, nil]
        output << current_line

      elsif label == "MODES"

        fhd_ignore_list = [
          "6018234P",
          "6018235B",
          "6018235P",
          "6018235W",
          "6018235Y",
          "6018240B",
          "6018241B"
        ] # but set to FHD at category stage

        @combo_code = @value
        .gsub("4096 x 2160 @ " ,"D4K")
        .gsub("3840 x 2160 @ " ,"4K")
        .gsub("1920 x 1080 @ " ,"FHD")
        .gsub("1280 x 720 @ " ,"HD")
        .gsub("23.98","23")
        .gsub("p ","P")
        .gsub("p, ","P")
        .gsub("i ","I")
        .gsub("i, ", "I")
        .gsub("/ ","")
        .gsub(" Mbps, ","")
        .gsub("MP4, ","M")
        .gsub("MOV, ", "V")
        .gsub("XAVC S, ","X")
        .gsub("AVCHD, ","A")
        .gsub("MTS, ","T")
        .gsub("H.264, ","H")
        .gsub("Linear PCM", "L")
        .gsub("AAC","A")
        .gsub("Dolby Digital","D")

        @label = "VIDEO MODES"
        @label_raw = "Video Modes - MODES"
        @data_type = ["combo", 0, 99, nil]

        unless @value.include? "3840 x 2160"
          output << current_line
        end

        # INSERT VIDEO MODE CATEGORIES (4k, HD, FHD, SD, etc.)

        @combo_code = nil
        @current_line = nil

        video_cats = {
          "4096 x 2160" => "DCI 4K",
          "3840 x 2160" => "4K",
          "1920 x 1080" => "FHD",
          "1280 x 720" => "HD"
        }

        @label = "VIDEO MODE CATEGORIES"
        @label_raw  = "Video Mode Categories"
        @data_type = ["combo", 0, 99, nil]

        if @value_raw.include? "4096 x 2160"
          @combo_code = "D4K"
          @value = "DCI 4K"
        elsif @value.include? "3840 x 2160"
          @combo_code = "4K"
          @value = "4K UHD"
        elsif @value.include? "1920 x 1080"
          @combo_code = "FHD"
          @value = "Full HD"
        elsif @value.include? "1280 x 720"
          @combo_code = "HD"
          @value = "HD"
        elsif @value.include? "3840 x 1920"
          @combo_code = "FHD"
          @value = "Full HD"          
        end

        output << current_line

      elsif label == "VIDEOGRAPHY NOTES"

        return []

      end

      return output unless output.empty?

    end

  end
end
