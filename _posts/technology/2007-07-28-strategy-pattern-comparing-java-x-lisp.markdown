--- 
wordpress_id: 334
title: "Strategy Pattern: comparing Java X Lisp"
wordpress_url: http://www.tiagoluchini.eu/2007/07/28/strategy-pattern-comparing-java-x-lisp/
layout: post
---
Very brave authors dare to say that some Design Patterns are very simple to be implemented or just unnecessary on Lisp. Their point is that Lisp has very good practices at its core so Design Patterns tend to arise easier.

Along this essay I will go through a very simple example that will deal with the Strategy Pattern _per se_.

**The problem at hand**

Let's assume that we need to write a small algorithm that takes a list of words and returns those starting with the letter 'f'.

**The Java approach**

Before diving into the Lisp code, let's solve this problem in pure Java first. Let's start with a very simple class called `ListExtractor` which has only one static method called `extract`:

    package org.luchini.listextractor;
    
    import java.util.ArrayList;
    
    public class ListExtractor {
      public static String[] extract (String[] list) {
        ArrayList&lt;String&gt; out = new ArrayList&lt;String&gt;();
        for (String word : list) {
          if (word.charAt(0) == 'f') {
            out.add(word);
          }
        }
        return out.toArray(new String[0]);
      }
    
    }
    
Very simple stuff here. Our method receives an array of `String`, iterates through its items and creates a new `ArrayList` containing those words starting with 'f'. It then returns the list to the caller by converting it back to a pure array.

If you have enough experience with Java you may have noticed that I wanted a very simple interface (just a basic array of Strings). This is one of the things that constantly bother developers on Java: having to choose which interface and the corresponding implementation to receive and return under list-based scenarios.

To make sure that our code works, let's write a 'test' class (no unit test here - just a simple main method for learning purposes). The `ListExtractorTest` class looks like this:

    package org.luchini.listextractor;
    
    public class ListExtractorTest {
    
      public static void main(String[] args) {
        String[] myList = new String[] {"foo", "bar", "foobar", "baz"};
        String[] newList = ListExtractor.extract(myList);
    
        for (String word : newList) {
          System.out.println(word);
        }
      }
    }

We send a list containing 4 words (foo, bar, foobar and baz) to the `extract` method. If we run this code, the result should be something like:

    foo
    foobar

**Strategy Pattern**

So our code works. But hei... we are good programmers and our current solution is very limited. If, by any chance, our business rules change in the future, we will be facing a huge problem.

Let's assume that some business people decide that now our algorithm needs to return the words starting with 'b' instead of 'f'. From a first look, we could easily change the line that checks for letter 'f' and make it check for letter 'b'. But business demands are rarely that simple: we may need to run some extra level of algorithms to decide if we should or should not extract the word (like querying a database of some kind for instance).

That is when the Strategy Pattern comes on handy. Our `ListExtrator` class will need to consult a Strategy implementation to decide whether the item must be extracted or not. Let's start by defining the `ExtractingStragey` interface:

    package org.luchini.listextractor;
    
    public interface ExtractingStrategy {
      public boolean isExtractable(String word);
    }
    
This interface defines only one method that returns a boolean by responding the question "is this specific word extractable?" Let's then implement this strategy for extracting 'b' words:

    package org.luchini.listextractor;
    
    public class ExtractingStrategyStartingBImpl implements ExtractingStrategy {
    
      public boolean isExtractable(String word) {
        return (word.charAt(0) == 'b');
      }
    
    }
    
Our `ExtractingStrategyStartingBImpl` class implements the `ExtractingStrategy` interface by checking whether the received word starts with 'b' - returning true when so and false otherwise.

Then we need to change our `ListExtractor` class to accept the strategy in place. A very simple alternative is to write it like this:

    package org.luchini.listextractor;
    
    import java.util.ArrayList;
    
    public class ListExtractor {
    
      public static String[] extract (String[] list**, ExtractingStrategy strategy**) {
        ArrayList&lt;String&gt; out = new ArrayList&lt;String&gt;();
        for (String word : list) {
          if (**strategy.isExtractable(word)**) {            out.add(word);
          }
        }
        return out.toArray(new String[0]);
      }
    }
    
Now our `ListExtractor` consults the Strategy implementation before acting upon extracting the word or not. Our `ListExtractorTest` has to be updated as well to reflect this new parameter required by `ListExtractor`'s `extract` method:

    package org.luchini.listextractor;
    
    public class ListExtractorTest {
    
      public static void main(String[] args) {
        String[] myList = new String[] {"foo", "bar", "foobar", "baz"};
        String[] newList = ListExtractor.extract(myList, new ExtractingStrategyStartingBImpl());
    
        for (String word : newList) {
          System.out.println(word);
        }
      }
    }
    
A successful run of this test will return:

    bar
    baz

The nice thing when using the Strategy Pattern is that our code becomes easily expandable and highly flexible. It is possible for example, to have multiple strategies and use the ones that better suits your needs. Let's implement the 'f' logic as well in its own class:

    package org.luchini.listextractor;
    
    public class ExtractingStrategyStartingFImpl implements ExtractingStrategy {
    
      public boolean isExtractable(String word) {
        return (word.charAt(0) == 'f');
      }
    
    }
And then we update the test class to run both strategies:

    package org.luchini.listextractor;
    
    public class ListExtractorTest {
    
      public static void main(String[] args) {
        String[] myList = new String[] {"foo", "bar", "foobar", "baz"};
    
        String[] newListB = ListExtractor.extract(myList, new ExtractingStrategyStartingBImpl());
        for (String word : newListB) {
          System.out.println(word);
        }
    
        System.out.println();
    
        String[] newListF = ListExtractor.extract(myList, new ExtractingStrategyStartingFImpl());
        for (String word : newListF) {
          System.out.println(word);
        }
    
      }
    }
    
Not a very beautiful test but a successful run shows:

    bar
    baz
    
    foo
    foobar

**Strategy Pattern is powerful**

I never get tired of repeating the sentence "Strategy Pattern is very powerful". It is a very simple approach when solving problems and opens a huge space for future expansions and/or eventual fixes.

Even so, I have seen lots of programmers just forgetting about this pattern or sending it to a second class category due to its "simplicity". This is exactly where the beauty of the pattern is: it is a simple pattern with very powerful capabilities.

**The Lisp approach**

Let's try to follow the same path as with Java. Lisp has a more functional approach and it is basically dynamic typing (so no need to be statically defining every single variable in your code). This reduces drastically the size of your code.

The way Lisp is structured also forces you into trying to solve the problems bottom up so, the first thing that comes to my mind is defining whether a word starts with 'f' or not. The function `is-f-start` follows:

    (defun is-f-start (word)
      (char= (elt word 0) #f))
      
I know it looks a little cryptic but the REPL (read-eval-print-loop) idea is very helpful here. This concept is very well-known by Perl, Python, Lua and Ruby developers but very unusual for someone from the Java school of thought.

The idea is to have the language responding as a command prompt in a terminal window. At the REPL console you can type all kind of crazy tests and approach your solution in a constructive manner (rather than blindly foreseen the future as in very lengthy and structured languages like Java).

Considering I am very new to Lisp I had to undergo some tests at the REPL console to achieve the above code. I first typed something like:

    (char= #f #f)

And received a T meaning true. This silly piece of code is checking if the character 'f' (`#\f`) is equal (`char=`) to the character 'f'. Although very stupid, this test made sure I knew how to write the equality expression.

The second step was to remember how to get a character from a string so I did:

    (elt "test" 0)</pre>

And got a `#\t` (character 't') as a response - the first (`0`) character of the `"test"` string.

After that it was just a matter of putting things together by using the `defun` macro to create a function:

    (defun is-f-start (word)
      (char= (elt word 0) #f))

To make sure I was in the right track, I typed:

    (is-f-start "forfo")    ==&gt; T
    (is-f-start "bar")    ==&gt; NIL

Meaning that "forfo" does start with 'f' and "bar" does not start with 'f' (great "achievement"!)

There is a function called `remove-if-not` that is capable of removing items on a list that do not meet a certain criteria. At the REPL console I tried:

    (remove-if-not #'evenp '(1 2 3 4))

The first parameter of `remove-if-not` is the function to be called when evaluating the items of the second parameter (which happens to be the list to be iterated). Special notation symbols express this scenario: `#'` is used to indicate a function (which could also be done by using `(function evenp)`) and `'` is used to indicate the special function 'quote' (which could also be done by using `(quote (1 2 3 4))`). That said, the following line is exactly equivalent than the above (just longer):

    (remove-if-not (function evenp) (quote (1 2 3 4)))
    
The `evenp` function returns true if the number passed to it is even and false otherwise so, this small line of code is removing those items on the list that are not even (removing the odds). The result, as expected is:

    (2 4)
    
The beauty of Lisp is that, with its entangled concept of data and code, we are not even talking about Strategy Pattern anymore: it is just happening!

Returning to our problem at hand, let's just couple `remove-if-not` and `is-f-start` together and see what happens:

    (remove-if-not #'is-f-start '("foo" "bar" "foobar" "baz"))

As expected, the result is:

    ("foo" "foobar")

Another interesting feature of Lisp is the `lambda` function. It allows you to create functions on the fly so, if you face a situation where testing the 'b' scenario is a quick thing, something like this could take care of the task:

    (remove-if-not #'(lambda(x) (char= (elt x 0) #b)) '("foo" "bar" "foobar" "baz"))

Notice that the `lambda` function is just like the `defun` used for `is-f-start`. It was just used "on the spot" instead of written somewhere else.

**Conclusion**

I must confess that, even having 10 years of Java experience on my back, it took me a couple of minutes to write this example didactically. Not a big mystery of course but the language is very lengthy, very descriptive and the IDE am using (Eclipse) is known to be very slow.

On the other hand, even having very little contact with Lisp, the solution just popped-up as I played with the REPL console. It was more a play than actually some work. I had more fun doing it - and it was much quicker- to my astonishment.

The bottom line though is that the Lisp way actually forced me to do the right thing at first. I did not have to imagine a nice UML diagram containing a tiny strategy pattern hanging on it. Practically every single function dealing with collections in Lisp come with a "function" parameter that can be used for tricks like the one used in this essay.
