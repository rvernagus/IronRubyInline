module IronRubyInline
  class CompilerParameters < System::CodeDom::Compiler::CompilerParameters
    def initialize
      super()
      self.generate_executable = false
      self.treat_warnings_as_errors = false
      self.compiler_options = "/optimize"
    end
  end
end
