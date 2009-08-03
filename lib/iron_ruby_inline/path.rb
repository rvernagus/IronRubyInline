module IronRubyInline
  module Path
    def self.tmpfile
      System::IO::Path.get_temp_file_name
    end
    
    def self.tmpdll
      tmp = tmpfile
      change_ext(tmp, "dll")
    end
    
    def self.change_ext(path, new_ext)
      System::IO::Path.change_extension(path, new_ext)
    end
  end
end
