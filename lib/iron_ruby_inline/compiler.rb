module IronRubyInline
  class Compiler
    attr_reader :parameters
    
    def initialize(output=nil)
      output = Path.tmpfile if output.nil?
      @parameters = CompilerParameters.new(output)
    end
    
    def provider(language)
      case language.to_s
      when /^c\#$|^cs(harp)?$/i
        ClrObjectFactory.create_csharp_provider
      when /^f\#$|^fs(harp)?$/i
        ClrObjectFactory.create_fsharp_provider
      when /^vb$/i
        ClrObjectFactory.create_vb_provider
      else
        raise ArgumentError, "Unsupported language"
      end
    end
  end
end
