module IronRubyInline
  class ClrObjectFactory
    def self.create_compiler_parameters
      System::CodeCom::Compiler::CompilerOptions
    end
  end
end
