module PhotographySpecs

  def clean_photography_specs

    output = []

    if heading == "PHOTOGRAPHY FEATURES"

      if label == "MINIMUM SHUTTER SPEED" #Done

        @label_raw = "Minimum shutter speed (seconds)"
        @value = value.gsub(" sec","")

        if @value.include? "/"
          arr = @value.split("/")
          @value = arr[0].to_f/arr[1].to_f
        end

        @combo_code = @value.to_s.gsub(".","_")

        @data_type = ["combo", 0, 1, 1]
        output << current_line

      elsif label == "MAXIMUM SHUTTER SPEED" #Done

        @label_raw = "Maximum shutter speed (seconds)"
        @value = value.gsub(" sec","")
        @combo_code = @value.gsub("1/","").gsub("000","K")

        case @combo_code
          when "1300" then @combo_code = "1_3K"
          when "1500" then @combo_code = "1_5K"
          when "1600" then @combo_code = "1_6K"
          when "3200" then @combo_code = "3_2K"
        end

        @data_type = ["combo", 0, 1, 1]
        output << current_line

      elsif label == "APERTURE PRIORITY" #Done

        @value = value.split("(")[0].strip
        @value = boolean_value
        @data_type = ["boolean", 0, 1, nil]
        output << current_line

      elsif label == "SHUTTER PRIORITY" #Done

        @value = value.split("(")[0].strip
        @value = boolean_value
        @data_type = ["boolean", 0, 1, nil]
        output << current_line

      elsif label == "MANUAL EXPOSURE MODE" #Done

        @value = value.split("(")[0].strip
        @value = boolean_value
        @data_type = ["boolean", 0, 1, nil]
        output << current_line

      elsif label == "SUBJECT / SCENE MODES" #Done

        @label = "SCENE MODE"
        @label_raw = "Scene mode"
        @value = value.split("(")[0].strip
        @value = boolean_value
        @data_type = ["boolean", 0, 1, nil]
        output << current_line

      elsif label == "BUILT-IN FLASH" #Done

        @value = value.split("(")[0].strip
        @value = boolean_value
        @data_type = ["boolean", 0, 1, nil]
        output << current_line

      elsif label == "EXTERNAL FLASH" #Done

        @value = value.split("(")[0].strip
        @value = boolean_value
        @data_type = ["boolean", 0, 1, nil]
        output << current_line

      elsif label == "CONTINUOUS DRIVE" #Done

        @label_raw = "Continuous Drive (fps)"
        @data_type = ["number", 0, 1, 1]
        @value = value.gsub("fps","").strip
        output << current_line

      elsif label == "SELF-TIMER" #Done

        @value = value.split("(")[0].strip
        @value = boolean_value
        @data_type = ["boolean", 0, 1, nil]
        output << current_line

      elsif label == "METERING MODES" #Done

        case value
          when "Spot AF-area" then @value = "Spot"
          when "Center-weighted" then @combo_code = "Center weighted"
          when "Highlight-weighted" then @combo_code = "Highlight weighted"
        end

        @data_type = ["combo", 0, 99, nil]
        output << current_line

      elsif label == "EXPOSURE COMPENSATION" #Done

        @value = @value.split(" ")[0]
        @combo = value.gsub("±", "")
        @value = value + " stops"

        @data_type = ["combo", 0, 1, nil]
        output << current_line

      elsif label == "AE BRACKETING" #Done

        if value[0] == "±"
          @value = value.split(" ")[0]
          @combo_code = value.gsub("±", "")
          if @value.split("")[1] == "1"
            @value = value + " stop"
          else
            @value = value + " stops"
          end

          @data_type = ["combo", 0, 1, nil]
          output << current_line
        else
          return []
        end

      elsif label == "WB BRACKETING" #Done

        @value = value.split("(")[0].strip
        @value = boolean_value
        @data_type = ["boolean", 0, 1, nil]
        output << current_line

      elsif label == "FLASH RANGE" #Done

        @label_raw = "Flash Range (metres)"
        @value = value
        .gsub("(@ ", "(")
        .gsub("(at ","(")
        .gsub("(with Auto ISO)", "(Auto ISO)")
        .gsub("(ISO Auto (W))", "(Auto ISO)")
        .gsub("(with included external flash at ISO 100)", "(ISO 100)")

        @data_type = ["string", 0, 1, nil] # metres
        output << current_line

      elsif label == "FLASH MODES" #Done

        @data_type = ["combo", 0, 99, nil]
        @combo_code = nil
        @current_line = nil

        case value.downcase
          when "Auto, on, sl0w synchro, off".downcase then @value = "Auto, On, Slow sync, Off"
          when "Auto, On, Slow Synchro, Off".downcase then @value = "Auto, On, Slow sync, Off"
          when "Auto, On, Off,  Red-eye".downcase then @value = "Auto, On, Slow sync, Red-eye reduction"
          when "Auto, on, off, slow synchro".downcase then @value = "Auto, On, Off, Slow sync"
          when "Auto, Forced Flash, Suppressed Flash, Slow Synchro".downcase then @value = "Auto, On, Off, Slow sync"
          when "Auto, forced, suppressed, slow synchro, commander".downcase then @value = "Auto, On, Off, Slow sync, Commander"
          when "Auto, flash on, flash off, slow synchro, rear-curtain synchro, commander".downcase then @value = "Auto, On, Off, Slow sync, Rear-curtain sync, Commander"
          when "Auto, On, Off, Red-Eye, Slow Sync, Rear-curtain".downcase then @value = "Auto, On, Off, Red-eye reduction, Slow sync, Rear-curtain sync"
          when "Auto, On, Off, Red-Eye, Slow Sync, Rear-curtain, Commander".downcase then @value = "Auto, On, Off, Red-eye reduction, Slow sync, Rear-curtain sync, Commander"
          when "Auto, forced flash, slow synchro, flash off, rear-curtain synchro, commander".downcase then @value = "Auto, On, Slow sync"
          when "Auto, standard, slow sync, manual, commander".downcase then @value = "Auto, Standard, Slow sync, Manual, Commander"
          when "Auto, forced flash, slow synchro, suppressed flash, rear-curtain synchro, commander)".downcase then @value = "Auto, On, Slow sync, Off, Rear-curtain sync, Commander"
          when "Auto, standard, slow sync, manual, off".downcase then @value = "Auto, Standard, Slow sync, Manual, Off"
          when "Auto, auto w/redeye reduction, off, fill flash, slow sync".downcase then @value = "Auto, Red-eye reduction, Off, Fill flash, Slow sync"
          when "Auto, Auto slow sync, Auto slow sync with red-eye reduction, Auto with red-eye reduction, Fill-flash, Off, Rear-curtain sync, Rear-curtain with slow sync, Red-eye reduction, Red-eye reduction with slow sync, Slow sync".downcase then @value = "Auto, Slow sync, Red-eye reduction, Fill flash, Off, Rear-curtain sync, Slow sync"
          when "Auto, On, Off, Red-eye, Slow sync, Rear curtain".downcase then @value = "Auto, On, Off, Red-eye reduction, Slow sync, Rear-curtain sync"
          when "Auto, auto FP high-speed sync, auto w/redeye reduction, fill flash, rear-curtain sync, rear-curtain w/slow sync, redeye reduction, redeye reduction w/slow sync, slow sync, off".downcase then @value = "Auto, Hi-speed sync, Red-eye reduction, Fill flash, Rear-curtain sync, Slow sync, Off"
          when "Auto, Auto FP high-speed sync, auto w/redeye reduction, auto slow sync, auto slow sync w/redeye reduction, fill flash, rear-curtain sync, rear-curtain w/slow sync, redeye reduction, redeye reduction w/slow sync, slow sync, off".downcase then @value = "Auto, Hi-speed sync, Red-eye reduction, Fill flash, Rear-curtain sync, Slow sync, Off"
          when "Auto, On, Off, Red-eye, Slow sync, Rear curtain, High-speed sync".downcase then @value = "Auto, On, Off, Red-eye reduction, Slow sync, Rear-curtain sync, Hi-speed sync"
          when "Front-curtain sync, slow sync, rear-curtain sync, redeye reduction, redeye reduction w/slow sync, slow rear-curtain sync".downcase then @value = "Front-curtain sync, Slow sync, Rear-curtain sync, Red-eye reduction"
          when "Front-curtain sync (normal), Rear-curtain sync, Red-eye reduction, Red-eye reduction with slow sync, Slow sync".downcase then @value = "Front-curtain sync, Slow sync, Rear-curtain sync, Red-eye reduction"
          when "Auto FP High-speed sync, front-curtain sync, rear-curtain sync, redeye reduction,".downcase then @value = "Auto, Hi-speed sync, Front-curtain sync, Rear-curtain sync, Red-eye reduction"
          when "Auto FP high-speed sync, front-curtain, rear-curtain, redeye reduction, redeye reduction w/slow sync, slow rear-curtain sync, off".downcase then @value = "Auto, Hi-speed sync, Front-curtain sync, Rear-curtain sync, Red-eye reduction, Slow sync, Off"
          when "Auto, manual, redeye reduction, slow sync w/redeye reduction, slow sync , slow sync 2nd-curtain, fill-in, off".downcase then @value = "Auto, Manual, Red-eye reduction, Slow sync, Rear-curtain sync, Fill flash, Off"
          when "Flash Auto, Redeye, Fill-in, Flash Off, Red-eye Slow sync (1st curtain), Slow sync (1st curtain), Slow sync (2nd curtain)".downcase then @value = "Auto, Red-eye reduction, Fill flash, Off, Red-eye reduction, Slow sync"
          when "Auto, redeye reduction, fill flash, flash off, 1st-curtain slow sync w/redeye, 1st-curtain slow sync, 2nd-curtain slow sync, manual".downcase then @value = "Auto, Red-eye reduction, Fill flash, Off, Slow sync, Manual"
          when "Auto, redeye, slow sync, 2nd-curtain slow sync, redeye slow sync, fill-in, manual, off".downcase then @value = "Auto, Red-eye reduction, Slow sync, Fill flash, Manual, Off"
          when "Flash Auto, Redeye, Fill-in, Flash Off, Red-eye Slow sync.(1st curtain), Slow sync.(1st curtain), Slow sync.(2nd curtain), Manual（1/1（FULL）～1/64）".downcase then @value = "Auto, Red-eye reduction, Fill flash, Rear-curtain sync, Front-curtain sync, Manual"
          when "Auto, On, Off, Red-Eye, Fill-in, Slow Sync (2), Manual (3 levels)".downcase then @value = "Auto, On, Off, Red-eye reduction, Fill flash, Slow sync, Manual"
          when "Auto, redeye, fill, off, redeye slow sync, slow sync, 2nd-curtain slow sync, manual".downcase then @value = "Auto, Red-eye reduction, Fill flash, Off, Slow sync, Rear-curtain sync, Manual"
          when "Redeye, Fill-in, Flash Off, Red-eye Slow sync.(1st curtain), Slow sync.(1st curtain), Slow sync.(2nd curtain), Manual".downcase then @value = "Red-eye reduction, Fill flash, Off, Front-curtain sync, Rear-curtain sync, Manual"
          when "Auto, redeye reduction, slow sync, redeye slow sync, fill, manual, off".downcase then @value = "Auto, Red-eye reduction, Slow sync, Fill flash, Manual, Off"
          when "Auto, On, Off, Red-eye, Slow Sync, Slow Sync+Redeye, Trailing Curtain Sync, Wireless".downcase then @value = "Auto, On, Off, Red-eye reduction, Slow sync, Rear-curtain sync, Wireless"
          when "Auto, auto w/redeye reduction, flash on, flash + redeye reduction, slow sync, trailing curtain sync, manual".downcase then @value = "Auto, Red-eye reduction, On, Slow sync, Rear-curtain sync, Manual"
          when "Auto, auto w/redeye reduction, flash on w/redeye reduction, slow sync, trailing curtain sync, manual, wireless".downcase then @value = "Auto, Red-eye reduction, On, Slow sync, Rear-curtain sync, Manual, Wireless"
          when "Auto, auto + redeye, on, on + redeye reduction, slow sync, trailing curtain sync, manual".downcase then @value = "Auto, Red-eye reduction, Slow sync, Rear-curtain sync, Manual"
          when "Auto, auto w/redeye reduction, flash on, flash on + redeye reduction, slow sync, trailing curtain sync, manual flash".downcase then @value = "Auto, Red-eye reduction, On, Slow sync, Rear-curtain sync, Manual"
          when "Auto, on, off, red-eye, slow sync, slow sync + red-eye, trailing curtain sync, high speed, wireless, manual".downcase then @value = "Auto, On, Off, Red-eye reduction, Slow sync, Rear-curtain sync, Hi-speed sync, Wireless, Manual"
          when "Auto Flash Discharge, Auto Flash + Red-eye Reduction, Flash On, Flash On + Red-eye Reduction, Slow-speed Sync, Slow-speed Sync + Red-eye, P-TTL, Trailing Curtain Sync, Contrast-control-sync, High-speed sync, Wireless sync (available with dedicated external flash)".downcase then @value = "Auto, Red-eye reduction, On, Slow sync, Rear-curtain sync, Hi-speed sync, Wireless"
          when "Auto Flash Discharge, Auto Flash + Red-eye Reduction, Flash On, Flash On + Red-eye Reduction, Slow-speed Sync, Slow-speed Sync + Red-eye, P-TTL, Trailing Curtain Sync, Contrast-control-sync, High-speed sync, Wireless sync".downcase then @value = "Auto, Red-eye reduction, On, Slow sync, Rear-curtain sync, Hi-speed sync, Wireless"
          when "Flash On, Flash On+Red-eye Reduction, Slow-speed Sync, Slow-speed Sync+Red-eye, P-TTL, Trailing Curtain Sync, contrast-control-sync, high-speed sync, wireless sync".downcase then @value = "On, Red-eye reduction, Slow sync, Rear-curtain sync, Hi-speed sync, Wireless"
          when "Auto, flash off, flash on, auto + redeye".downcase then @value = "Auto, Off, On, Red-eye reduction"
          when "On, off".downcase then @value = "On, Off"
          when "Auto, flash off, flash on, auto + redeye, on + redeye".downcase then @value = "Auto, Off, On, Red-eye reduction"
          when "Auto, Flash On, Flash Synchro., Manual Flash, Red-Eye Flash Auto, Red-Eye Flash On, Red-Eye Flash Synchro, Wireless".downcase then @value = "Auto, On, Manual, Red-eye reduction, Wireless"
          when "Auto, flash on, slow sync, flash off, rear sync".downcase then @value = "Auto, On, Off, Slow sync, Rear-curtain sync"
          when "Auto, on, slow synchro, off, advanced".downcase then @value = "Auto, On, Slow sync, Off"
          when "Auto, On, Off, Slow syncro".downcase then @value = "Auto, On, Off, Slow sync"
          when "Auto, On, Off, Slow Sync".downcase then @value = "Auto, On, Off, Slow sync"
          when "Flash Off / Autoflash / Fill-flash / Slow Sync. / Advanced Flash / Rear Sync. / Wireless (with optional compliant flash)".downcase then @value = "Off, Auto, Fill flash, Slow sync, Rear-curtain sync, Wireless"
          when "Auto, On, Off, Slow Sync, Rear Sync, Wireless".downcase then @value = "Auto, On, Off, Slow sync, Rear-curtain sync, Wireless"
          when "Off, auto, fill flash, slow sync, rear sync, wireless".downcase then @value = "Off, Auto, Fill flash, Slow sync, Rear-curtain sync, Wireless"
          when "Auto, fill-flash, slow sync, rear sync, off".downcase then @value = "Auto, Fill flash, Slow sync, Rear-curtain sync, Off"
          when "Flash off, Autoflash, Fill-flash, Rear Sync, Slow Sync, Red-eye reduction, Hi-speed sync, Wireless".downcase then @value = "Off, Auto, Fill flash, Rear-curtain sync, Slow sync, Red-eye reduction, Hi-speed sync, Wireless"
          when "Off, Auto, Fill-flash, Slow Sync, Rear Sync, Red-eye reduction, Wireless, Hi-speed sync".downcase then @value = "Off, Auto, Fill flash, Rear-curtain sync, Slow sync, Red-eye reduction, Hi-speed sync, Wireless"
          when "Flash off, Autoflash, Fill-flash, Slow Sync., Rear Sync., Red-eye reduction, Wireless, Hi-speed sync".downcase then @value = "Off, Auto, Fill flash, Rear-curtain sync, Slow sync, Red-eye reduction, Hi-speed sync, Wireless"
          when "Flash off, Autoflash, Fill-flash, Rear Sync., Slow Sync., Red-eye reduction".downcase then @value = "Off, Auto, Fill flash, Rear-curtain sync, Slow sync, Red-eye reduction"
          when "Flash off, auto, fill-flaw, slow sync, redeye reduction".downcase then @value = "Off, Auto, Fill flash, Slow sync, Red-eye reduction"
          when "Flash off, auto, fill-flaw, slow sync, redeye reduction, hi-speed sync, wireless control".downcase then @value = "Off, Auto, Fill flash, Slow sync, Red-eye reduction, Hi-speed sync, Wireless"
          when "Flash off, Autoflash, Fill-flash, Rear Sync., Slow Sync., Red-eye reduction, Hi-speed sync, Wireless".downcase then @value = "Off, Auto, Fill flash, Rear-curtain sync, Slow sync, Red-eye reduction, Hi-speed sync, Wireless"
          when "Flash off, Autoflash, Fill-flash, Rear Sync., Slow Sync., Red-eye reduction (On/Off selectable), Hi-speed sync, Wireless".downcase then @value = "Off, Auto, Fill flash, Rear-curtain sync, Slow sync, Red-eye reduction, Hi-speed sync, Wireless"
          when "Flash off, Auto, Fill-flash, Slow sync, Red-eye reduction, Rear sync, Wireless, High Speed sync".downcase then @value = "Off, Auto, Fill flash, Rear-curtain sync, Slow sync, Red-eye reduction, Hi-speed sync, Wireless"
          when "Auto, fill, rear sync, slow sync".downcase then @value = "Auto, Fill flash, Rear-curtain sync, Slow sync"
          when "Off, auto, fill, slow sync, redeye reduction, rear sync, high-speed sync, wireless".downcase then @value = "Off, Auto, Fill flash, Slow sync, Red-eye reduction, Rear-curtain sync, Hi-speed sync, Wireless"
          when "Automatic, automatic/red eye reduction, on, on/red eye reduction, long-term synchronization/red eye reduction, off".downcase then @value = "Auto, Red-eye reduction, On, Off"
          when "Auto, auto w/redeye reduction, flash on, flash on w/redeye reduction, slow sync, slow sync w/redeye reduction".downcase then @value = "Auto, Red-eye reduction, On, Slow sync"
          when "Auto, auto w/redeye reduction, on, on w/redeye reduction, slow sync, slow sync w/redeye reduction".downcase then @value = "Auto, Red-eye reduction, On, Slow sync"
          when "Auto, auto w/redeye reduction, on, on w/redeye reduction, slow sync, slow sync w/redeye reduction, off".downcase then @value = "Auto, Red-eye reduction, On, Slow sync, Off"
          when "Auto, Auto/Red-eye Reduction, Forced On, Forced On/Red-eye Reduction, Slow Sync, Slow Sync/Red-eye Reduction, Forced Off".downcase then @value = "Auto, Red-eye reduction, On, Slow sync, Off"
          when "Front Curtain, Rear Curtain, Slow sync".downcase then @value = "Front-curtain sync, Rear-curtain sync, Slow sync"
          when "Auto, auto w/redeye reduction, on, slow sync w/redeye reduction, off".downcase then @value = "Auto, Red-eye reduction, On, Slow sync, Off"
          when "Auto, Auto/Red-eye Reduction, Forced On, Slow Sync./Red-eye Reduction, Forced Off".downcase then @value = "Auto, Red-eye reduction, On, Slow sync, Off"
          when "Auto, Auto/Red-eye Reduction, Forced On, Forced On/Red-eye Reduction, Slow Sync., Slow Sync./Red-eye Reduction, Forced Off".downcase then @value = "Auto, Red-eye reduction, On, Slow sync, Off"
          when "Auto, Auto/Red-eye Reduction, Forced Off, Forced On, Forced On/Red-eye Reduction, Slow Sync, Slow Sync/Red-eye Reduction, 1st Curtain Sync, 2nd Curtain Sync".downcase then @value = "Auto, Red-eye reduction, On, Slow sync, Off, Front-curtain sync, Rear-curtain sync"
          when "Auto, Auto w/ red-eye Reduction, Forced On, Forced On w/Red-eye Reduction, Slow Sync, Slow Sync w/Red-eye Reduction, Forced Off".downcase then @value = "Auto, Red-eye reduction, On, Slow sync, Off"
          when "Auto, On, Off, Red-Eye, Slow Sync".downcase then @value = "Auto, On, Off, Red-eye reduction, Slow sync"
          when "Auto, Auto & Red-eye reduction, Fill-in flash, Slow sync, Slow sync w/red-eye reduction, off".downcase then @value = "Auto, Red-eye reduction, Fill flash, Slow sync, Off"
          when "Auto, auto w/redeye reduction, forced on, forced on w/redeye reduction, slow sync, slow sync w/redeye reduction, forced off".downcase then @value = "Auto, Red-eye reduction, On, Slow sync, Off"
          when "Auto, Auto/Redeye Reduction, Forced On, Forced On w/Redeye Reduction, Slow Sync, Slow Sync w/Redeye Reduction, Forced Off".downcase then @value = "Auto, Red-eye reduction, On, Slow sync, Off"
        end

        all_flash_modes = @value.split(", ")

        all_flash_modes.each do |mode|
  
          @value = mode.strip

          @combo_code = nil
          @current_line = nil

          case value
            when "Auto" then @combo_code = "A"
            when "Commander" then @combo_code = "C"
            when "Fill flash" then @combo_code = "FF"
            when "Front-curtain sync" then @combo_code = "FCS"
            when "Hi-speed sync" then @combo_code = "HSS"
            when "Manual" then @combo_code = "M"
            when "Off" then @combo_code = "OFF"
            when "On" then @combo_code = "ON"
            when "Rear-curtain sync" then @combo_code = "RCS"
            when "Red-eye reduction" then @combo_code = "RER"
            when "Slow sync" then @combo_code = "SS"
            when "Standard" then @combo_code = "S"
            when "Wireless" then @combo_code = "W"
          end

          output << current_line

        end

      elsif label == "MAXIMUM SHUTTER SPEED (ELECTRONIC)" #Done

        @combo_code = @value.gsub("1/","").gsub("000","K").gsub(" sec", "")

        @data_type = ["combo", 0, 1, nil]
        output << current_line

      end

      return output unless output.empty?

    end

  end
end


