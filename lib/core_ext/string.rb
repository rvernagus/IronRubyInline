class String
  def compile(options={})
    language = options[:language] || :cs
    parameters = IronRubyInline::CompilerParameters.new
    parameters.references = options[:references] || []
    
    compiler = IronRubyInline::Compiler.new(language)
    compiler.compile_and_load(self, parameters)
  end
end
