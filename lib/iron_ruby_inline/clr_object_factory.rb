module IronRubyInline
  class ClrObjectFactory
    def self.create_compiler_parameters
      System::CodeDom::Compiler::CompilerParameters.new
    end
  end
end
