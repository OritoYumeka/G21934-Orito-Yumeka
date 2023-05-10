import java.util.stream.IntStream;

public class FizzBuzz {
        public static void main(String[] args) {
            IntStream.rangeClosed(1, 100)
                  .mapToObj(i -> i % 15 == 0 ? "FizzBuzz" : i % 5 == 0 ? "Buzz" : i % 3 == 0 ? "Fizz" : i)
                  .forEach(System.out::print);
        }
}