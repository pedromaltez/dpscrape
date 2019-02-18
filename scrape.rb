require "nokogiri"
require "pry"
Dir.glob(__dir__ + '/mixins/*.rb', &method(:require))

class Scraper

  attr_accessor :out, :files, :sku, :heading, :label, :label_new, :label_raw, :value, :value_raw, :data_type, :line, :spec_type, :combo_code

  include LensSpecs
  include CameraSpecs
  include PrinterSpecs
  include GeneralSpecs

  def initialize
    @out = []
    @files = Dir["output/skus/*.html"]
    # @files = Dir["output/skus/*.html"]
  end

  def update_cur_vars(line)
    @data_type = nil
    @sku = line[0].upcase
    @heading = line[1].upcase
    @label = line[2].upcase
    @label_raw = line[2]
    @label_new = nil
    @value = line[3]
    @value_raw = line[3]
    @current_line = nil
    @spec_type = nil
    @combo_code = nil
  end

  def cleanit(line)
    @line = line
    puts "line -------->>>>>> #{line}"
    update_cur_vars(@line)

    output = []

    ret_val = nil
    ret_val =  clean_camera_specs || clean_lens_specs || clean_general_specs || clean_printer_specs
    return ret_val unless ret_val.nil?

    if heading == ""
    end

    if heading == "PRICE"
      return output
    elsif heading.nil?
      return output
    else
      @data_type = ["'--- UNKNOWN --- CLEANIT DEFAULT", 0, 99, nil]
      output << current_line
    end

    return output
  end

  def current_line

    attr_code = attribute_code(heading, label)
    puts "attr_code ---------- #{attr_code}"

    @current_line ||= [sku, attr_code, value_or_response_code(attr_code), nil_or_desc].push(*data_type).push(*[nil, heading,label_raw, value])

  end

  def joinLines(arr)

    if arr[0].class == Array
      tout = []
      arr.each do |tarr|
        tout << tarr.join("\t")
      end
      return tout.join("\n")
    else
      return arr.join("\t")
    end

  end

  def attribute_code(attribute_category, attribute_name)

    return ["S" + spec_type, str_split_join(attribute_name)]
    .join("_")
    .upcase
    .gsub("(","")
    .gsub(")","")
    .gsub(">","")
    .gsub("<","")
    .gsub("/","")
    .gsub("-","")
    .gsub(":","")
    .gsub(".","_")
    .gsub("&","AND")
    .gsub("AUTO_DUPLEX_DOUBLE_SIDED_PRINTING", "DUPLEX")
    .gsub("ENVIRONMENTAL_SEALING", "ESEAL")
    .gsub("UNCOMPRESSED_FORMAT", "UFORMAT")
    .gsub("VIEWFINDER_COVERAGE", "VFC")
    .gsub("MICROPHONE", "MIC")
    .gsub("FLASH_MODES", "FM")
    .gsub("ZOOM_METHOD", "ZMETHOD")
    .gsub("MATERIAL", "MAT")
    .gsub("FOCUS_DISTANCE","FDIST")
    .gsub("MAXIMUM_APERTURE","MAXA")
    .gsub("MINIMUM_APERTURE","MINA")
    .gsub("IMAGE_RATIO_WH","IR")
    .gsub("DROPLET_SIZE", "DPSIZE")
    .gsub("FOCUS_METHOD", "FMETHOD")
    .gsub("STORAGE_TYPES", "STTYPES")
    .gsub("CIPA_IMAGE", "CIMG")
    .gsub("LENS_MOUNT", "LMOUNT")
    .gsub("SCREEN_TYPE", "SCTYPE")
    .gsub("SCREEN_SIZE", "SCSIZE")
    .gsub("OPTIONAL","OPT")
    .gsub("OPERATING_SYSTEM","OS")
    .gsub("SPECIAL_ELEMENTS_COATINGS","SEC")
    .gsub("ACCESSORY","ACC")
    .gsub("ACCESSORIES","ACC")
    .gsub("BW_RES","BWRES")
    .gsub("COLOUR_RES","CRES")
    .gsub("MOTOR_TYPE","MTYPE")
    .gsub("LIMITER","LMT")
    .gsub("SENSOR_","S")
    .gsub("WHITE_BALANCE","WBAL")
    .gsub("COLOR","COLOUR")
    .gsub("MINIMUM","MIN")
    .gsub("MAXIMUM","MAX")
    .gsub("SPECIAL","SP")
    .gsub("ELEMENT","EL")
    .gsub("MULTIPLIER","X")
    .gsub("MAGNIFICATION","MAG")
    .gsub("STABILIZATION","STAB")
    .gsub("_RATING","")
    .gsub("AUTOFOCUS","AF")
    .gsub("IMAGE","IMG")
    .gsub("BATTERY","BAT")
    .gsub("BATTERIES","BAT")
    .gsub("EXTERNAL","EXT")
    .gsub("ENVIRONMENTALLY","ENV")
    .gsub("EXPOSURE","EXP")
    .gsub("RESOLUTIONS","RES")
    .gsub("RESOLUTION","RES")
    .gsub("MAX_RES", "MR")
    .gsub("ARTICULATED_LCD","ALCD")
    .gsub("SUPPORTED_MEDIA","SUPPMEDIA")
    .gsub("VIEWFINDER","VF")
    .gsub("MANUAL_FOCUS","MF")
    .gsub("COMPENSATION","COM")
    .gsub("SHUTTER_SPEED","SHUT")
    .gsub("SHUTTER","SHUT")
    .gsub("FILTER_THREAD","FTHREAD")
    .gsub("ELECTRONIC","ELCT")
    .gsub("FOCAL_LENGTH","FLEN")
    .gsub("NUMBER_OF","NO")
    .gsub("CROSSTYPE","XTYP")
    .gsub("POINTS", "PTS")
    .gsub("BAT_LIFE_CIPA", "CBAT_LIFE")
    .gsub("PROCESSOR", "PROC")
    .gsub("PHOTO_DETECTORS", "PIXELS")
    .gsub("COLOUR_TECHNOLOGY", "C_TECH")
    .gsub("BODY_TYPE", "TYPE")
    .gsub("DIAPHRAGM_BLADES", "BLADES")
    .gsub("APERTURE_RING", "ARING")
    .gsub("CONSTANT_APERTURE", "CA")
    .gsub("METERING_", "M")
    .gsub("VIDEO_", "V")
    .gsub("VMODES", "VM")
    .gsub("VMODE_CATEGORIES","VMCAT")
    .gsub("MAX_DOCUMENT_SIZE","MDOCSIZE")
    .gsub("SC_MAX_SHUT_ELCT", "SC_MAX_ESHUT")
    .gsub("SL_MAX_FORMAT_SIZE", "SL_MAXFORMAT")
    .gsub("FORMATS", "FORMAT")
    .gsub("RECORDING", "REC")
    .gsub("BRACKETING", "BR")
    .gsub("TOUCH_SCREEN", "TS")
    .gsub("TOUCHSCREEN", "TS")
    .gsub("IMG_STAB", "IS")
    .gsub("OTHER_RES","ORES")
    .gsub("C_TECH","CTECH")
    .gsub("ETHERNET","ETH")
    .gsub("DOCSIZE","DS")
    .gsub("SUPPMEDIA", "MEDIA")
    .gsub("MAXFORMAT","MXF")
    .gsub("MAX_CRES", "MCR")
    .gsub("BAT_POWERED", "BP")
    .gsub("MAX_BWRES", "MBWR")
    .gsub("DIRECT_PRINTING", "DPRINT")
    .gsub("EFFECTIVE_PIXELS", "EPIXELS")
    .gsub("ISO_BOOSTED", "ISOB")
    .gsub("INC_BAT", "IBAT")
    .gsub("_NUMBER", "N")
    .gsub("_TEXT", "T")
    .gsub("__", "_")

  end

  def underscore_initials(str)
    res = ""
    str.split("_").each do |s|
      res += s[0,1]
    end

    return res
  end

  def str_split_join(str)
    str
    .upcase
    .gsub("(","")
    .gsub(")","")
    .gsub(">","")
    .gsub("<","")
    .gsub("/","")
    .gsub("-","")
    .gsub(":","")
    .gsub(".","_")
    .gsub("&","AND")
    .gsub("COLOR","COLOUR")
    .split(" - ")
    .join("_")
    .split(" ")
    .join("_")
  end

  def element_description(attribute_category, attribute_name)
    return attribute_name
  end

  def value_or_response_code(attribute_code)
    if isCombo?
      @combo_code ||= @value.gsub("±","")
      .split
      .map(&:capitalize)
      .map{ |str| str[0] }
      .join("")
      .strip
      return [attribute_code, combo_code].join("_")
        .upcase
        .gsub("(","")
        .gsub(")","")
        .gsub(">","")
        .gsub("<","")
        .gsub("/","")
        .gsub("-","")
        .gsub(":","")
        .gsub(".","_")
        .gsub("&","AND")
        .gsub("COLOR","COLOUR")
    else
      return value
    end
  end

  def isCombo?
    return data_type[0] == "combo"
  end

  def nil_or_desc
    if isCombo?
      return value
    else
      return nil
    end
  end

  def boolean_value
    if value.upcase == "YES"
      return 1
    end
    if value.upcase == "NO"
      return 0
    end
  end

  # def ProductRelatedDataElementCreationImport(outputRelatedDataElements)
  #   groupCode = outputRelatedDataElements[0]
  #   elementCode = outputRelatedDataElements[1]
  #   elementDescription = outputRelatedDataElements[2]
  #   elementType = outputRelatedDataElements[3]
  #   noDecimals = outputRelatedDataElements[4]
  #   minResponses = outputRelatedDataElements[5]
  #   maxResponses = outputRelatedDataElements[6]
  #   return [groupCode, elementCode, elementDescription, elementType, noDecimals, minResponses, maxResponses]
  # end

  # def ProductRelatedDataImport(outputRelatedData)
  #   productCode = outputRelatedData[0]
  #   elementCode = outputRelatedData[1]
  #   dataOrResponseCode = outputRelatedData[2]
  #   responseDescription = outputRelatedData[3]
  #   formattedText = outputRelatedData[4]
  #   return [productCode, elementCode, dataOrResponseCode, responseDescription, formattedText]
  # end

  def scrape_files()

    files.each do |filename|

      file = File.open(filename)
      sku = File.basename(file).delete(".html")

      res = Nokogiri::HTML(file) do |config|
        config.strict.noblanks
      end

      headings = res.css("table.specsTable thead")

      headings.each do |heading|

        rawheading = heading
        heading = heading.text.strip
        labels = rawheading.next_sibling.css(".label")

        labels.each do |label|

          rawlabel = label
          label = label.text.strip
          lis = rawlabel.next_sibling.next_sibling.css("li")

          if lis.length > 0

            arr = []

            lis.each do |li|
              arr << li.text.strip
            end

            arr.each do |el|
              line = joinLines(cleanit([sku, heading, label, el]))
              @out << line
            end

          else

            line = joinLines(cleanit([sku, heading, label, rawlabel.next_sibling.next_sibling.text.strip.split("\r\n").join("; ")]))

            if !line.empty?
              @out << line
            end

          end
        end
      end
    end

    @out = @out.join("\n").split("\n")

    File.open("output2.txt", "w") do |file|
      file.write(["sku", "attr_code", "value_or_response_code", "combo_desc", "data_type", "min_res", "max_res", "precision", "nil", "heading","label_raw", "value"].join("\t") +"\n")
      file.write(@out.uniq.join("\n"))
    end

  end

end

scraper = Scraper.new
scraper.scrape_files
