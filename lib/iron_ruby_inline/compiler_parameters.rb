module IronRubyInline
  class CompilerParameters
    attr_reader :output, :references

    def initialize(output, references=[])
      @output, @references = output, references
    end
    
    def to_clr_parameters
      params = ClrObjectFactory.create_compiler_parameters
      params.generate_executable = false
      params.treat_warnings_as_errors = false
      params.compiler_options = "/optimize"
      params.output_assembly = output
      references.each { |r| params.referenced_assemblies.add(r) }
      params
    end
  end
end
