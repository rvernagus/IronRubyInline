module IronRubyInline
  class Path
    def self.tmpfile
      System::IO::Path.get_temp_file_name
    end
  end
end
