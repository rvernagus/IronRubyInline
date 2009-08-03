require "../lib/iron_ruby_inline"

%Q{
public class Cat
{
    public void Greet()
    {
        System.Console.WriteLine("Hai  u!");
    }
}
}.compile

cat = Cat.new
cat.greet # Hai u!
