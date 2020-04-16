require "clim"

module Paper::Reading::Helper
  VERSION = "0.1.0"

  class Cli < Clim
    main do
      desc "A helper tool for reading papers"
      usage "paper-reading-helper -i [INPUT_FILE_NAME] -o [OUTPUT_FILE_NAME]"
      option "-i FILE_NAME", "--input=FILE_NAME", type: String
      option "-o FILE_NAME", "--output=FILE_NAME", type: String
      help short: "-h"
      run do |opts, args|
        input_file_name = opts.input
        output_file_name = opts.output
        if input_file_name.nil? || output_file_name.nil?
          puts opts.help_string
          abort
        end

        source = File.read input_file_name
        output_file = File.open filename: output_file_name, mode: "w"

        if source.nil?
          puts "[ERROR] cannot open file"
          abort
        end
        source = source.gsub("-\n", "")
        source = source.gsub("\n", " ")
        source = source.gsub("- ", "")
        source = source.gsub("Fig. ", "Fig.")
        source = source.gsub("No. ", "No.")
        source = source.gsub("Prof. ", "Prof.")
        source = source.gsub("Eq. ", "Eq.")
        source = source.gsub("et al. ", "et al.")
        strings = source.split(". ").map { |str| str + "." }

        word_limit = 4500
        word_count = 0
        strings.each do |string|
          word_count += string.size
          output_file << string + "\n"
          if word_count > word_limit
            output_file << "\n"
            output_file << "===============================================\n"
            output_file << "\n"
            word_count = 0
          end
        end
        output_file.close
      end
    end
  end
end

Paper::Reading::Helper::Cli.start(ARGV)
