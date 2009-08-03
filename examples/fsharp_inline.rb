require "../lib/iron_ruby_inline"
require "FSharp.Compiler.CodeDom, Version=1.9.6.16, Culture=neutral, PublicKeyToken=a19089b1c74d0809"

%Q{
namespace Lolz
type Cat() =
    member this.Greet() =
        printfn "Hai u!"
}.compile(:language => :fs)

cat = Lolz::Cat.new
cat.greet
