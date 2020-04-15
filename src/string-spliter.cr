require "clim"

module String::Spliter
  VERSION = "0.1.0"

  class Cli < Clim
    main do
      option "-i FILE_NAME", "--input=FILE_NAME", type: String
      run do |opts, args|
        file_name = opts.input
        source = args.join(" ")

        if file_name
          source = File.read file_name
        end
        source = source.gsub("\n", " ")
        source = source.gsub("- ", "")
        strings = source.split(". ").map { |str| str + "." }

        word_limit = 4000
        word_count = 0
        strings.each do |string|
          word_count += string.size
          puts string
          if word_count > word_limit
            puts ""
            puts "==============================================="
            puts ""
            word_count = 0
          end
        end
      end
    end
  end
end

String::Spliter::Cli.start(ARGV)
