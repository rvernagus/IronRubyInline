module IronRubyInline
  class CompilerParameters < System::CodeDom::Compiler::CompilerParameters
    def initialize(output)
      super()
      self.generate_executable = false
      self.treat_warnings_as_errors = false
      self.compiler_options = "/optimize"
      self.output_assembly = output
    end
  end
end
