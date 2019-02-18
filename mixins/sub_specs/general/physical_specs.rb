module PhysicalSpecs

  def clean_physical_specs

    output = []

    if heading == "PHYSICAL"

      if ((label == "ENVIRONMENTALLY SEALED") || (label == "DURABILITY") || (label == "SEALING"))

        @label = "ENVIRONMENTAL SEALING"
        @label_raw = "Environmental Sealing"

        @data_type = ["combo", 0, 99, nil]

        case @value
          when "Yes" then @value = "Yes"
          when "Yes (dust and water-resistent)" then @value = "Yes,  Water Resistant, Dust Resistant"
          when "Yes (Splash and dust resistant)" then @value = "Yes,  Splash Resistant, Dust Resistant"
          when "No" then @value = "return"
          when "Waterproof, Shockproof" then @value = "Waterproof, Shockproof"
          when "Yes (water and dust resistent)" then @value = "Yes,  Water Resistant, Dust Resistant"
          when "Yes (Water and dust resistant)" then @value = "Yes,  Water Resistant, Dust Resistant"
          when "Yes (waterproof to 30m, shockproof to 2.4m, freezeproof to -10C, dustproof)" then @value = "Yes, Waterproof, Shockproof, Freezeproof, Dustproof"
          when "Yes (Weather and dust resistant)" then @value = "Yes, Weather Resistant, Dust Resistant"
          when "Yes (dust and water resistant)" then @value = "Yes,  Water Resistant, Dust Resistant"
          when "Yes (Weather and dust sealed, freezeproof to -010C/+14F)" then @value = "Yes, Weather Sealed, Dust Sealed, Freezeproof"
          when "Yes (waterproof to 12m/40ft, shockproof from 1.5m/5ft, crushproof to 100kgf/220lbf, freezeproof to -10C/+14F)" then @value = "Yes, Waterproof, Shockproof, Crushproof, Freezeproof"
          when "Yes (waterproof to 14m, shockproof from 2.2m, crushproof to 100kgf, freezeproof to -10C/+14F)" then @value = "Yes, Waterproof, Shockproof, Crushproof, Freezeproof"
          when "Waterproof with housing" then @value = "return"
          when "Yes (Waterproof to 8m/23ft, shockproof to 1.5m/5ft, freezeproof to -10C/+14F)" then @value = "Yes, Waterproof, Shockproof, Freezeproof"
          when "Yes (Water and Dust resistant )" then @value = "Yes,  Water Resistant, Dust Resistant"
        end

        if value == "return"
          return []
        end

        all_sealings = @value.split(",")

        all_sealings.each do |sealing|
          @value = sealing.strip

          case @value
            when "Yes" then @combo_code = "Y"
            when "Water Resistant" then @combo_code = "WAR"
            when "Dust Resistant" then @combo_code = "DR"
            when "Splash Resistant" then @combo_code = "SR"
            when "Waterproof" then @combo_code = "WP"
            when "Shockproof" then @combo_code = "SP"
            when "Freezeproof" then @combo_code = "FP"
            when "Dustproof" then @combo_code = "DP"
            when "Weather Resistant" then @combo_code = "WR"
            when "Weather Sealed" then @combo_code = "WS"
            when "Dust Sealed" then @combo_code = "DS"
            when "Crushproof" then @combo_code = "CP"
          end

          output << current_line

          @combo_code = nil
          @current_line = nil
        end



        # if value == "Yes"
        #   @value = "FANTASTIC"
        # end

        # @value = value
        # .downcase
        # .gsub("-", " ")
        # .gsub("resistent", "resistant")
        # .gsub("waterproof with housing", "")
        # .gsub("splash and dust resistant", "splash resistant, dust resistant")
        # .strip

        # @value_raw = value

        # @combo_code = nil
        # @current_line = nil



        # if value == "fantastic"
        #     @value = "Yes"
        #     output << @current_line

        #     @combo_code = nil
        #     @current_line = nil
        #     @value = value_raw
        # end

        # if @value == "no"
        #   @value = "None"
        #   output << current_line

        #   @combo_code = nil
        #   @current_line = nil
        #   @value = value_raw
        # end

        # if @value.include? "waterproof"
        #   @value = "Waterproof"
        #   @combo_code = "WP"
        #   output << current_line

        #   @combo_code = nil
        #   @current_line = nil
        #   @value = value_raw
        # end

        # if @value.include? "shockproof"
        #   @value = "Shockproof"
        #   @combo_code = "SP"
        #   output << current_line

        #   @combo_code = nil
        #   @current_line = nil
        #   @value = value_raw
        # end

        # if @value.include? "crushproof"
        #   @value = "Crushproof"
        #   @combo_code = "CP"
        #   output << current_line

        #   @combo_code = nil
        #   @current_line = nil
        #   @value = value_raw
        # end

        # if @value.include? "freezeproof"
        #   @value = "Freezeproof"
        #   @combo_code = "FP"
        #   output << current_line

        #   @combo_code = nil
        #   @current_line = nil
        #   @value = value_raw
        # end

        # if @value.include? "dust resistant"
        #   @value = "Dust resistant"
        #   output << current_line

        #   @combo_code = nil
        #   @current_line = nil
        #   @value = value_raw
        # end

        # if @value.include? "water resistant"
        #   @value = "Water resistant"
        #   output << current_line

        #   @combo_code = nil
        #   @current_line = nil
        #   @value = value_raw
        # end

        # if @value.include? "water and dust resistant"
        #   @value = "Water resistant"
        #   output << current_line

        #   @combo_code = nil
        #   @current_line = nil
        #   @value = value_raw
        # end

        # if @value.include? "dust and water resistant"
        #   @value = "Dust resistant"
        #   output << current_line

        #   @combo_code = nil
        #   @current_line = nil
        #   @value = value_raw
        # end

        # if @value.include? "weather and dust resistant"
        #   @value = "Weather resistant"
        #   @combo_code = "WTHR"
        #   output << current_line

        #   @combo_code = nil
        #   @current_line = nil
        #   @value = value_raw
        # end

        # if @value.include? "splash and dust resistant"
        #   @value = "Water resistant"
        #   output << current_line

        #   @combo_code = nil
        #   @current_line = nil
        #   @value = value_raw
        # end

        # if @value.include? "weather and dust sealed"
        #   @value = "Dust sealed"
        #   output << current_line

        #   @combo_code = nil
        #   @current_line = nil
        #   @value = value_raw
        # end

        # if @value.include? "weather and dust sealed"
        #   @value = "Weather sealed"
        #   output << current_line

        #   @combo_code = nil
        #   @current_line = nil
        #   @value = value_raw
        # end

        if @value.empty?
          return []
        end


      # elsif label == "DURABILITY"

      #   @label = "ENVIRONMENTAL SEALING"
      #   @label_raw = "Environmental Sealing -- DURABILITY"


      #   @label = "ENVIRONMENTAL SEALING"
      #   @label_raw = "Environmental Sealing"

      #   @data_type = ["combo", 0, 99, nil]

      #   @value = value
      #   .downcase
      #   .gsub("-", " ")
      #   .gsub("resistent", "resistant")
      #   .gsub("waterproof with housing", "")
      #   .gsub("splash and dust resistant", "splash resistant, dust resistant")
      #   .strip

      #   @value_raw = value

      #   @combo_code = nil
      #   @current_line = nil

      #   if @value == "Yes"
      #     @value = "Yes"
      #     output << @current_line

      #     @combo_code = nil
      #     @current_line = nil
      #     @value = value_raw
      #   end

      #   if @value == "no"
      #     @value = "None"
      #     output << current_line

      #     @combo_code = nil
      #     @current_line = nil
      #     @value = value_raw
      #   end

      #   if @value.include? "waterproof"
      #     @value = "Waterproof"
      #     @combo_code = "WP"
      #     output << current_line

      #     @combo_code = nil
      #     @current_line = nil
      #     @value = value_raw
      #   end

      #   if @value.include? "shockproof"
      #     @value = "Shockproof"
      #     @combo_code = "SP"
      #     output << current_line

      #     @combo_code = nil
      #     @current_line = nil
      #     @value = value_raw
      #   end

      #   if @value.include? "crushproof"
      #     @value = "Crushproof"
      #     @combo_code = "CP"
      #     output << current_line

      #     @combo_code = nil
      #     @current_line = nil
      #     @value = value_raw
      #   end

      #   if @value.include? "freezeproof"
      #     @value = "Freezeproof"
      #     @combo_code = "FP"
      #     output << current_line

      #     @combo_code = nil
      #     @current_line = nil
      #     @value = value_raw
      #   end

      #   if @value.include? "dust resistant"
      #     @value = "Dust resistant"
      #     output << current_line

      #     @combo_code = nil
      #     @current_line = nil
      #     @value = value_raw
      #   end

      #   if @value.include? "water resistant"
      #     @value = "Water resistant"
      #     output << current_line

      #     @combo_code = nil
      #     @current_line = nil
      #     @value = value_raw
      #   end

      #   if @value.include? "water and dust resistant"
      #     @value = "Water resistant"
      #     output << current_line

      #     @combo_code = nil
      #     @current_line = nil
      #     @value = value_raw
      #   end

      #   if @value.include? "dust and water resistant"
      #     @value = "Dust resistant"
      #     output << current_line

      #     @combo_code = nil
      #     @current_line = nil
      #     @value = value_raw
      #   end

      #   if @value.include? "weather and dust resistant"
      #     @value = "Weather resistant"
      #     @combo_code = "WTHR"
      #     output << current_line

      #     @combo_code = nil
      #     @current_line = nil
      #     @value = value_raw
      #   end

      #   if @value.include? "splash and dust resistant"
      #     @value = "Water resistant"
      #     output << current_line

      #     @combo_code = nil
      #     @current_line = nil
      #     @value = value_raw
      #   end

      #   if @value.include? "weather and dust sealed"
      #     @value = "Dust sealed"
      #     output << current_line

      #     @combo_code = nil
      #     @current_line = nil
      #     @value = value_raw
      #   end

      #   if @value.include? "weather and dust sealed"
      #     @value = "Weather sealed"
      #     output << current_line

      #     @combo_code = nil
      #     @current_line = nil
      #     @value = value_raw
      #   end

      #   if @value.empty?
      #     return []
      #   end



      # elsif label == "SEALING"

      #   @label = "ENVIRONMENTAL SEALING"
      #   @label_raw = "Environmental Sealing -- SEALING"



      #   @label = "ENVIRONMENTAL SEALING"
      #   @label_raw = "Environmental Sealing"

      #   @data_type = ["combo", 0, 99, nil]

      #   @value = value
      #   .downcase
      #   .gsub("-", " ")
      #   .gsub("resistent", "resistant")
      #   .gsub("waterproof with housing", "")
      #   .gsub("splash and dust resistant", "splash resistant, dust resistant")
      #   .strip

      #   @value_raw = value

      #   @combo_code = nil
      #   @current_line = nil

      #   if @value == "Yes"
      #     @value = "Yes"
      #     output << @current_line

      #     @combo_code = nil
      #     @current_line = nil
      #     @value = value_raw
      #   end

      #   if @value == "no"
      #     @value = "None"
      #     output << current_line

      #     @combo_code = nil
      #     @current_line = nil
      #     @value = value_raw
      #   end

      #   if @value.include? "waterproof"
      #     @value = "Waterproof"
      #     @combo_code = "WP"
      #     output << current_line

      #     @combo_code = nil
      #     @current_line = nil
      #     @value = value_raw
      #   end

      #   if @value.include? "shockproof"
      #     @value = "Shockproof"
      #     @combo_code = "SP"
      #     output << current_line

      #     @combo_code = nil
      #     @current_line = nil
      #     @value = value_raw
      #   end

      #   if @value.include? "crushproof"
      #     @value = "Crushproof"
      #     @combo_code = "CP"
      #     output << current_line

      #     @combo_code = nil
      #     @current_line = nil
      #     @value = value_raw
      #   end

      #   if @value.include? "freezeproof"
      #     @value = "Freezeproof"
      #     @combo_code = "FP"
      #     output << current_line

      #     @combo_code = nil
      #     @current_line = nil
      #     @value = value_raw
      #   end

      #   if @value.include? "dust resistant"
      #     @value = "Dust resistant"
      #     output << current_line

      #     @combo_code = nil
      #     @current_line = nil
      #     @value = value_raw
      #   end

      #   if @value.include? "water resistant"
      #     @value = "Water resistant"
      #     output << current_line

      #     @combo_code = nil
      #     @current_line = nil
      #     @value = value_raw
      #   end

      #   if @value.include? "water and dust resistant"
      #     @value = "Water resistant"
      #     output << current_line

      #     @combo_code = nil
      #     @current_line = nil
      #     @value = value_raw
      #   end

      #   if @value.include? "dust and water resistant"
      #     @value = "Dust resistant"
      #     output << current_line

      #     @combo_code = nil
      #     @current_line = nil
      #     @value = value_raw
      #   end

      #   if @value.include? "weather and dust resistant"
      #     @value = "Weather resistant"
      #     @combo_code = "WTHR"
      #     output << current_line

      #     @combo_code = nil
      #     @current_line = nil
      #     @value = value_raw
      #   end

      #   if @value.include? "splash and dust resistant"
      #     @value = "Water resistant"
      #     output << current_line

      #     @combo_code = nil
      #     @current_line = nil
      #     @value = value_raw
      #   end

      #   if @value.include? "weather and dust sealed"
      #     @value = "Dust sealed"
      #     output << current_line

      #     @combo_code = nil
      #     @current_line = nil
      #     @value = value_raw
      #   end

      #   if @value.include? "weather and dust sealed"
      #     @value = "Weather sealed"
      #     output << current_line

      #     @combo_code = nil
      #     @current_line = nil
      #     @value = value_raw
      #   end

      #   if @value.empty?
      #     return []
      #   end



      elsif label == "BATTERY DESCRIPTION" #Done

        return []

      elsif label == "WEIGHT (INC. BATTERIES)" #Done

        # camera spec

        @label_raw = "Weight inc. batteries (g)"
        @value = value.split("g")[0].strip

        @data_type = ["number", 0, 1, 0]
        output << current_line

      elsif label == "DIMENSIONS" #Done

        if value.split("(")[0].include?("mm")
          @value = value.split("mm")[0].strip.split(" x ")
          @value_raw = value
        else
          @value = value.split("(")[1].split("mm")[0].strip.split(" x ")
          @value_raw = value
        end

        @label = "WIDTH"
        @label_raw = "Width (mm)"

        @value = value[0]

        @data_type = ["number", 0, 1, 0]
        output << current_line

        @value = value_raw
        @current_line = nil

        @label = "HEIGHT"
        @label_raw = "Height (mm)"

        @value = value[1]

        output << current_line

        @current_line = nil
        @value = value_raw

        @label = "DEPTH"
        @label_raw = "Depth (mm)"

        @value = value[2]

        output << current_line

      elsif label == "WEIGHT" #Done

        @label_raw = "Weight (g)"

        if !value.to_s.include?("g")
          if value.to_s.include?("lb")
            @value = (value.match('^[^\lb]*')[0].strip().to_f * 453.59237).round()
            @data_type = ["number", 0, 1, 0]
            output << current_line
          end
        else
          @data_type = ["number", 0, 1, 0]
          @value = value.match('^[^\g]*')[0].strip().to_f.round()
          output << current_line
        end

      elsif label == "DIAMETER" #Done

        @label_raw = "Diameter (mm)"

        @value = value.split("mm")[0].strip

        @data_type = ["number", 0, 1, 0]
        output << current_line

      elsif label == "LENGTH" #Done

        @label_raw = "Length (mm)"
        @value = value.split("mm")[0].strip

        @data_type = ["number", 0, 1, 0]
        output << current_line

      elsif label == "COLOUR" #Done

        case @sku
          when "L242588M" then @value = "Black"
          when "L242588P" then @value = "Silver"
          when "4246510R" then @value = "Silver"
          when "4246515K" then @value = "Black"
          when "4246515V" then @value = "Silver"
          when "L242595K" then @value = "Black"
          when "L242595R" then @value = "Silver"
          when "L242597K" then @value = "Black"
          when "L242597R" then @value = "Silver"
          when "L242598K" then @value = "Black"
          when "L242598R" then @value = "Silver"
          when "L242599K" then @value = "Black"
          when "L242599R" then @value = "Silver"
          when "L242606K" then @value = "Black"
          when "L242607K" then @value = "Black"
          when "L242608R" then @value = "Silver"
          when "1240289E" then @value = "Black & White"
          when "1240305M" then @value = "Black & White"
          when "1240315" then @value = "Black & White"
          when "1240327N" then @value = "Black & White"
          when "1240348" then @value = "Black & White"
          when "1240361G" then @value = "Black & White"
          when "1240363D" then @value = "Black & White"
          when "1240375K" then @value = "Black & White"
          when "1240537E" then @value = "Black & White"
          when "1240546" then @value = "Black & White"
          when "1240337C" then @value = "Black & White"
          when "1240517" then @value = "Black & White"
          when "1240614E" then @value = "Black & White"
          when "1240623D" then @value = "Black & White"
          when "7240793T" then @value = "Black & White"
          when "4245119E" then @value = "Silver"
          when "4245119K" then @value = "Black"
          when "4245126C" then @value = "Silver"
          when "4245126K" then @value = "Black"
          when "4245128G" then @value = "Silver"
          when "4245128K" then @value = "Black"
          when "L242525H" then @value = "Black"
          when "L242525S" then @value = "Silver"
          when "1240549C" then @value = "Black & White"
          when "7240785R" then @value = "Black & White"
          when "7240762K" then @value = "Black"
          when "7240582M" then @value = "Black"
          when "4246495K" then @value = "Black"
          when "4245111H" then @value = "Black"
          when "2242356K" then @value = "Black"
          when "2242325B" then @value = "Black"
          when "P241097K" then @value = "Black"
          when "P241097V" then @value = "Silver"
          when "P241097Y" then @value = "Silver"
          when "9248818K" then @value = "Black"
          when "9248818S" then @value = "Silver"
          when "9248829K" then @value = "Black"
          when "9248829S" then @value = "Silver"
          when "9248834K" then @value = "Black"
          when "9248834S" then @value = "Silver"
          when "9248843K" then @value = "Black"
          when "9248843S" then @value = "Silver"
          when "9248847K" then @value = "Black"
          when "9248847S" then @value = "Silver"
          when "1245224E" then @value = "Graphite"
          when "1245311E" then @value = "Graphite"
          when "1245318E" then @value = "Graphite"
          when "1245230W" then @value = "Graphite"
          when "1245319K" then @value = "Graphite"
          when "1245319R" then @value = "Silver"
          when "2242125K" then @value = "Black"
          when "2242125R" then @value = "Silver"
          when "2242131E" then @value = "Black"
          when "2242131L" then @value = "Silver"
          when "2242146K" then @value = "Black"
          when "2242146S" then @value = "Silver"
          when "2242159K" then @value = "Black"
          when "2242159S" then @value = "Silver"
          when "2242323L" then @value = "Black"
          when "2242323S" then @value = "Silver"
          when "2242324K" then @value = "Black"
          when "5241020H" then @value = "Black"
          when "5241088H" then @value = "Black"
          when "L242615M" then @value = "Black"
          when "L242615S" then @value = "Silver"
          when "5241026E" then @value = "Black"
          when "4245124V" then @value = "Silver"
          when "7240787E" then @value = "Black & White"
          when "7242778T" then @value = "Black & White"
          when "G242244G" then @value = "Silver"
          when "G242245L" then @value = "Silver"
          when "G242245OB" then @value = "Silver"
          when "L242599T" then @value = "Black & Silver"
          when "3240211" then @value = "Black"
        end

        @data_type = ["combo", 0, 99, nil]

        all_colours = @value.split("&")

        all_colours.each do |colour|

          @value = colour.strip.capitalize

          case value
            when "Black" then @combo_code = "K"
            when "Silver" then @combo_code = "S"
            when "White" then @combo_code = "W"
            when "Graphite" then @combo_code = "GT"
          end

          output << current_line
          @current_line = nil
          @combo_code = nil

        end


      elsif label == "OPTIONAL ACCESSORIES" #Done

        return []

      end

      return output unless output.empty?

    end

  end

end
