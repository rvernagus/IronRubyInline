module IronRubyInline
  module Compiler
    def self.provider(language)
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
    
    def self.compile(code, options={})
      output = options[:output] || Path.tmpfile
      parameters = CompilerParameters.new(output)
      
      compile_from_parameters(code, parameters)
    end
    
    def self.compile_from_parameters(code, parameters)
      use(provider(parameters.language)) do |prov|
        prov.compile_assembly_from_source(code)
      end
    end
  end
end
