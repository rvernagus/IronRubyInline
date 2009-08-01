module System
  module CodeDom
    module Compiler
      class CompilerParameters
        attr_accessor :generate_executable
        
        def initialize
          @generate_executable = true
        end
      end
    end
  end
end
