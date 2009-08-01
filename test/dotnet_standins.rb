module System
  module CodeDom
    module Compiler
      class CompilerParameters
        attr_accessor :generate_executable, :treat_warnings_as_errors
        
        def initialize
          @treat_warnings_as_errors = true
          @generate_executable = true
        end
      end
    end
  end
end
