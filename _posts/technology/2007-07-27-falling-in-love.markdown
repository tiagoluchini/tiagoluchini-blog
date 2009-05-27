--- 
wordpress_id: 333
title: Falling in Love
wordpress_url: http://www.tiagoluchini.eu/2007/07/27/falling-in-love/
layout: post
---
I am falling in love... No. I am not talking about some new girl - I am more than happy with my superb and lovely wife!  I am talking about LISP: I am falling in love with LISP.

LISP, for those unaware of its existence, is a very old-dated programming language that is said to have been discovered in 1958 by John McCarthy and Steve Russel (yes - you read that right - LISPers claim the  language was a phenomenon that was "discovered" rather than "invented" as other computer languages were).

It is a language of its own league. It hardly resembles anything that you have ever seen. If you check the [genealogy of computer languages](http://www.levenez.com/lang/history.html) you quickly notice that LISP was born different and continues to be different nowadays.

I had read a couple of articles about LISP very superficially in the past and just despised it by the simple fact it was "too damn weird" for me.

But things changed a while ago. I was writing a list of methodologies and technologies for my co-workers to catch-up. The idea was to cover the important technological improvements of the last decade or so. Things like XML, aspect oriented programming (AOP), reflection using annotation, inversion of control (IoC) and dependency injection were all part of the list.

After a couple of hours endevouring to create this list, I realized it was really long (some of my co-workers later confessed me they simply bookmarked it to be read in the future due to the fact it was really, really huge).

Looking at this very long list, one could feel happy that lots of features evolved a lot during the last 10 years. But for me something is just missing. Each language that I know has lots of pros and cons. Sometimes I feel it would be perfect if I could choose the best features of each language, mix them together and have a general-purpose language that would be simple to use and yet very powerful.

In a way, this is exactly what has been happening with some languages that resisted over time or with the new ones being invented: they become a huge mixture of patches to achieve more powerful scenarios.

Then I became puzzled by stories like that of [Paul Graham](http://www.paulgraham.com/). The guy went completely against the tide. When the web-revolution started he decided to use the very-old LISP instead of the competing technologies of the time (CGI-based, Java Servlets, ASP and similar buzz-technologies).

The fact is that, with a very small team, Mr. Graham managed to create in 1995 a world-class web application that humiliated competition. The company was so successful that it was bought by Yahoo three years later by something around 48 million dollars. Moreover, the guy advocates he has never needed to create a class in his life and sees no need for object oriented programming (OOP) - my teaching subjects would go down the drain if this guy ruled the universe.

This is simply too special to be ignored. I decided then to dive a little further into the rabbit hole.

Amazingly enough, as I go deeper and deeper I start to realize that lots of things that were "invented" during the last decade were actually part of LISP since its conception in 58 (almost 50 years ago!). Things like garbage collection, dynamic typing, no differentiation between statements and expressions and passing functions as data are still in their early years in most modern languages but were all included in LISP since its birth! Moreover, LISP still has unique features that are impossible to be mimicked by the present structure of other languages.

So, what is the problem with LISP? A full essay about that shall be written in the future but, for now, I would say it is "different" or "foreign". The following example explains a lot:

    (remove-if-not #'(lambda (x) (char= (elt x 0) #\f))
      '("foo" "bar" "foobar" "baz"))

With more than 10 years of programming experience, I must confess this puzzled me a lot at first and I had to really understand the concept behind the language to write the above code. _For those curious enough, the code takes a list of words ("foo", "bar", "foobar" and "baz") and returns a list containing those words which do not start with the character 'f' ("bar" and "baz")._

It takes some time for you to realize why the language is so strange. When you do so, it becomes clear that no language will ever match the richness of LISP. If they ever do so, they simply become a dialect of LISP.

I still have a lot to learn and will certainly start sharing my findings. Hope to make more LISP friends!
