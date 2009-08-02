module IronRubyInline
  class ClrObjectFactory
    def self.create_compiler_parameters
      System::CodeDom::Compiler::CompilerParameters.new
    end
    
    def self.create_csharp_provider
      Microsoft::CSharp::CSharpCodeProvider.new
    end
    
    def self.create_vb_provider
      Microsoft::VisualBasic::VBCodeProvider.new
    end
    
    def self.create_fsharp_provider
      Microsoft::FSharp::Compiler::CodeDom::FSharpCodeProvider.new
    end
  end
end
