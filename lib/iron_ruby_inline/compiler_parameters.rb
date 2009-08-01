module IronRubyInline
  class CompilerParameters < System::CodeDom::Compiler::CompilerParameters
    def initialize
      self.generate_executable = false
    end
  end
end
