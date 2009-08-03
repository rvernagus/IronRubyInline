require "../lib/iron_ruby_inline"

%Q{
  Public Class Cat
      Public Sub Greet()
          System.Console.WriteLine("Hai u!")
      End Sub
  End Class
}.compile(:language => :vb)

cat = Cat.new
cat.greet
