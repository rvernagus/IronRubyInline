module System
  module CodeDom
    module Compiler
      class CompilerParameters
        attr_accessor :generate_executable, :treat_warnings_as_errors,
                      :compiler_options, :output_assembly,
                      :referenced_assemblies
        
        def initialize
          @treat_warnings_as_errors = true
          @generate_executable = true
          @referenced_assemblies = []
          def @referenced_assemblies.add(item) self << item; end
        end
      end
    end
  end
end
