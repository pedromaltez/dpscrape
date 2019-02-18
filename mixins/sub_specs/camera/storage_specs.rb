module StorageSpecs

  def clean_storage_specs

    output = []

    if heading == "STORAGE"

      if label == "STORAGE INCLUDED"

        return []

      elsif label == "STORAGE TYPES"

        # Split out

        list = [
          "SD UHS-I",
          "SD UHS-II",
          "microSD",
          "Compact Flash",
          "XQD"
        ]

        @data_type = ["combo", 0, 99, nil]

        if @sku == "3011080K"

          @value = "XQD"
          @combo_code = "XQD"
          output << current_line

          @combo_code = nil
          @current_line = nil

        elsif @sku == "3011080X"

          @value = "CompactFlash"
          @combo_code = "CF"
          output << current_line

          @combo_code = nil
          @current_line = nil

        else

          if @value.upcase.include? "SD"
            unless @value.upcase.include? "MICROSD"
              @value = "SD"
              @combo_code = "SD"
              output << current_line

              @value = @value_raw
              @combo_code = nil
              @current_line = nil
            end
          end

          if @value.upcase.include? "UHS-I"
            @value = "SD (UHS-I)"
            @combo_code = "SDI"
            output << current_line

            @value = @value_raw
            @combo_code = nil
            @current_line = nil
          end

          if @value.upcase.include? "UHS-I/II"
            @value = "SD (UHS-II)"
            @combo_code = "SDII"
            output << current_line

            @value = @value_raw
            @combo_code = nil
            @current_line = nil
          end

          if @value.upcase.include? "UHS-II"
            @value = "SD (UHS-II)"
            @combo_code = "SDII"
            output << current_line

            @value = @value_raw
            @combo_code = nil
            @current_line = nil
          end

          if @value.upcase.include? "MICROSD"
            @value = "microSD"
            @combo_code = "MSD"
            output << current_line

            @value = @value_raw
            @combo_code = nil
            @current_line = nil
          end

          if @value.upcase.include? "COMPACTFLASH"
            @value = "CompactFlash"
            @combo_code = "CF"
            output << current_line

            @value = @value_raw
            @combo_code = nil
            @current_line = nil
          end

          if @value.upcase.include? "COMPACT FLASH"
            @value = "CompactFlash"
            @combo_code = "CF"
            output << current_line

            @value = @value_raw
            @combo_code = nil
            @current_line = nil
          end

          if @value.upcase.include? "XQD"
            @value = "XQD"
            @combo_code = "XQD"
            output << current_line

            @value = @value_raw
            @combo_code = nil
            @current_line = nil
          end

          if @value.upcase.include? "INTERNAL"
            @value = "Internal"
            @combo_code = "I"
            output << current_line

            @value = @value_raw
            @combo_code = nil
            @current_line = nil
          end

          if @value.upcase.include? "MEMORY"
            @value = "Memory Stick"
            @combo_code = "MS"
            output << current_line

            @value = @value_raw
            @combo_code = nil
            @current_line = nil
          end

        end

        @combo_code = nil
        @current_line = nil
        @label = "DUAL CARD"
        @label_raw = "Dual Card"
        @data_type = ["boolean", 0, 1, nil]

        if @value.upcase.include? "DUAL"
          @value = "YES"
          @value = boolean_value
          output << current_line
        else
          @value = "NO"
          @value = boolean_value
          output << current_line
        end

      end

      return output unless output.empty?

    end

  end

end
