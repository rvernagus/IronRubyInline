require "../lib/iron_ruby_inline"
begin
  require "FSharp.Compiler.CodeDom, Version=1.9.6.16, Culture=neutral, PublicKeyToken=a19089b1c74d0809"
rescue LoadError
  begin
    require "FSharp.Compiler.CodeDom, Version=1.9.7.8, Culture=neutral, PublicKeyToken=a19089b1c74d0809"
  rescue LoadError
    puts "Could not load FSharp.Compiler.CodeCom"
    exit
  end
end

%Q{
namespace Lolz
type Cat() =
    member this.Greet() =
        printfn "Hai u!"
}.compile(:language => :fs)

cat = Lolz::Cat.new
cat.greet # Hai u!
