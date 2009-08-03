module IronRubyInline
  class CodeProvider
    attr_reader :inner_provider
    
    def initialize(language=:cs)
      case language.to_s
      when /^c\#$|^cs(harp)?$/i
        @inner_provider = ClrObjectFactory.create_csharp_provider
      when /^f\#$|^fs(harp)?$/i
        @inner_provider = ClrObjectFactory.create_fsharp_provider
      when /^vb$/i
        @inner_provider = ClrObjectFactory.create_vb_provider
      else
        raise ArgumentError, "Unsupported language"
      end
    end
    
    def dispose
      inner_provider.dispose
    end
  end
end
