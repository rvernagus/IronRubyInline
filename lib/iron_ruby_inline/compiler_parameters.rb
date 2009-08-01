module IronRubyInline
  class CompilerParameters < System::CodeDom::Compiler::CompilerParameters
    def initialize(output, references=[])
      super()
      self.generate_executable = false
      self.treat_warnings_as_errors = false
      self.compiler_options = "/optimize"
      self.output_assembly = output
      references.each { |r| self.referenced_assemblies.add(r) }
    end
  end
end
