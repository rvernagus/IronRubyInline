class String
  def compile(options={})
    language = options[:language] || :cs
    compiler = IronRubyInline::Compiler.new(language)
    compiler.compile_and_load(self)
  end
end
