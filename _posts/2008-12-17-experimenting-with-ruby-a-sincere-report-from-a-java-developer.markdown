--- 
wordpress_id: 1131
title: Experimenting with Ruby - a sincere report from a Java developer
wordpress_url: http://tiagoluchini.eu/?p=1131
layout: post
---
First a little bit about myself: I'm an old-timer Java developer. Even though I can develop in quite a dozen other languages I always end up finding myself at home with java for one reason or another.

Of course, as in any long marriage, you can pinpoint all the small things that irritate you about your partner... I mean, your preferred language. That said, there are those times when I would like Java to be a real person whom I could physically inflict some severe pain. That's why I'm normally open to anything else that brushes on the shores of life and Ruby has had it's own turn.

Ruby is an object oriented language whose creators claim to have been designed with the "principle of least surprise" in mind. In marketing terms this means that they probably ran out of nice slogans and simply picked up one that people would memorize. They explain this concept by saying that things should be natural and that developers should not feel surprised by one or other feat of the language at hand. I'm normally not easily surprised so I'm biased to say that this whole principle sounds like total emptiness to me.

Not a good start for my Ruby research then. But God made me a very insistent person so I moved forward before choosing a real problem to be tackled by a Ruby experiment. As I investigated the language a series of mixed feelings blossomed. By one side, Ruby looked quite flexible and powerful but, a couple of features still looked more like a precarious tower of cards at the brisk of falling to pieces.

This was when I decided to spend a small fraction of my life to try Ruby in a real problem from my project backlog. I had a mathematical algorithm laying around just waiting to be tested. The whole mathematical model would wrap a board game system for some statistical and decision-making analysis. A couple of key requirements were:
<ul>
	<li>The model was very open and in its early stages. I knew it would change "a bit" (aka "a lot") as I typed and gave considerable attention to it.</li>
	<li>An exploratory approach would be very good during development. For my early Java plans this would take place in a prompt-like terminal tied to the algorithm somehow.</li>
	<li>I needed easy-to-use collections as the mathematical model was deeply ingrained in iteration steps.</li>
</ul>
These three requirements fit like a glove to Ruby. Ruby could easily tackle these requirements and that was when I started coding.

<strong>Statically typed versus Non-statically typed</strong>

This is a recurring nightmare for Java and C++ developers: "how will I write a piece of code without knowing the bloody type of that parameter?" Years and years of static typing can do a lot of harm to your way of coding. I'm not into the almost-religious debates most people engage when defending one side or another so here is my sincere input.

I like static-typing. It gives a relative sense of safety when developing. You feel safe by knowing that some crazy parameters really have what you are fetching from them. On the other hand, this can be a false sense of safety that can also lead to unexpected behavior. The typing does not protect your code from erroneous implementations on the other side. You think you are safe but aren't - really. Another thing that I have a constant feeling in Java, is that as I develop advanced code in complex algorithms, sometimes the need to use a generic Object to hold pointers to something else arises. This bothers me as it does not comply with the language so well and so often looks bad and misplaced.

That is the beauty of a non-statically typed language like Ruby. I can also very quickly relate to a non-statically typed language and like its "dubious" ways. It's flexible, it's open, it's liberating... it's scary.

Let's compare a method signature on Ruby with it's counter-part in Java:

<pre>def do_something(param)</pre>

<pre>ReturnSomething doSomething(BusinessObject param)</pre>

The potential sense of safety here comes from the fact that in Java you - "at least" - know what you are receiving and what has to be returned. Of course it's a complete nonsense due to the very simple fact that this does not protect you from potential implementation problems in BusinessObject or ReturnSomething.

This sends you back to Ruby non-statically typed scenario. First thing you notice is that "param" is an awful name for a parameter. It really does not give any hint of the content being passed around. The byproduct of this problem is quite interesting: you really have to focus on naming your variables and parameters clearly and also adding some documentation for your own use.

In a sick way, this is a good byproduct: after the first couple of hours developing with Ruby, I was getting very used to the "lack of safety" from a remote statically-typed system. A good naming convention and some clear, needed comments around (which would be needed in any language anyway) do the job quite well.

<strong>The IDE Challenge</strong>

IDEs are, in great extent, a continuation of the Java/C++ nightmares. It's obvious that some developers do use VI or Emacs to code - some might even use Notepad as far as I'm concerned - but many, many others end up using some IDE with a set of embedded assistant tools.

The statically-typed nature of Java does help IDEs a lot when it comes to content assistant. Want it or not, the IDE knows exactly which methods are available under a certain data type. It's as easy as two plus two. Ruby and other non-statically-typed languages lack this to some extent.

I'm almost sure there are some IDEs out there and/or nice plugins that might take care and circumvent this problem but I wanted to try the radical approach and I went for Gedit as an editor (simply because it was already installed on my computer so - no setup needed - and because the Ruby community recommends it as a replacement for Mac OS's TextMate).

It didn't take long for me to get very pissed off by the lack of auto completion. I then installed the WordCompletion plugin for Gedit as recommended by some Ruby developers. It works by indexing all words from your open documents and allowing you to use them at any place for auto completion.

This was not exactly what I wanted but it sure did its work. It is not as straight-forward as normal auto completion from statically-typed based IDEs but is still pretty much usable.

A good side effect of WordCompletion is that you get used to the fact that auto completion will be available everywhere. That means your variable names will be easier to name, as well as your methods, your classes and even some exception messages. I was very impressed by the shear repetition of certain words in different settings. That was quite revealing.

<strong>Duck-typing</strong>

This topic is still tied with the non-statically-typed discussion (and I promise it's the last one). Duck-typing comes from the idea that "if it quacks like a duck, walks like a duck... then it's a duck".

It sounds simple enough and basically means that types do not need to be checked against a set of interfaces. If a class implements the method "join", i.e., and you only need that method, you simply call it and expect it to work. No unnecessary casting as statically-typed languages would need.

At first look, it sounds like a gigantic step to simply assume that the implementation will work as expected. But, on the other hand, isn't that what we end up expecting in statically-typed languages as well? We still assume the implementation will respond accordingly even though we will have to entangle the whole call in casting and interface layers. When casting and interfacing we are basically complying with a statically-typed environment. At the end of the day, it adds very little to the fact that the remote implementation still has to work properly or else...

<strong>When need calls... unit tests respond</strong>

I'm really keen on unit testing. Not a freaky-keen though. In some of my personal quick projects, I end up not even doing it properly - I confess (even though the little white angel on my right shoulder constantly tells me to do so - but I can still lay my head on a pillow and totally ignore him).

Duck-typing and all the side-effects of a non-statically system was bugging me off. I was certain the whole thing would fall apart at some point. The solution? Unit testing of course. It took me amazingly little time to deploy the first tests. Absurdly amazing little time if compared to Java. In no time, I was testing complex mathematical algorithms that would otherwise be hard to test. Of course, lots and lots of bugs were found and fixed on the way.

This is another interesting side effect: maybe because the whole thing seems too fragile coped with the fact that you really spend very little time with the problem at hand (no onerous needs to encapsulate everything all over the place) you end up feeling that unit test is really handy. In Java-world, the false security of typing too much builds up to a level where you really think unit tests are secondary when they really shouldn't be.

<strong>Interactive Console</strong>

I must confess beforehand that the interactive console embedded with Ruby got me from the very start. It makes me wonder why it's not standard for every single language out there. Having a "hot" environment at the tips of your fingers to explore as you go is just a fantastic and powerful tool.

I can't praise the console hard enough. It is a wonderful tool not only for the learning process but also for checking out what is the current state of your code being developed. I did initially miss an auto completion system but a quick Google for it and I was back on business. You can easily test small sections of code or even try a section of your main code. You can fire up your test cases, retain the state objects and just play with then as you go. What an amazing little thing!

<strong>Refactoring</strong>

Some people focus "refactoring" mainly on "renaming" or "moving" things around. Most IDEs can take care of that and again, the statically-typed languages help the IDE's work a bit here. Refactoring for me is a deeper concept. I am constantly playing with my model, trying to make it more efficient or extend it to meet new business demands. The model in itself is constantly refactored in my projects. It is normally a work in progress with some intermediate checkpoints called releases.

IDEs normally don't help me here (I'm lying, they can help with some repetitive work which happens to be most of the time needed simply because of the structure of the language around the model - nothing more than that).

In that area, Ruby really felt much lighter. Again as a result of being non-statically typed for sure. It was so simple to change the model, shape it here, hammer it a bit there and get it the way I wanted after not so many hours.

<strong>Blocks, iterators and other Ruby-thingys</strong>

Ruby is full of interesting little things that make the Ruby developers shiver in shear excitement but that takes some time for hard-headed non-Ruby developers like me to grasp. Blocks are cool and, if used wisely, can be very powerful. Procs are not so intuitive and do look like potential bombs to me. I might be wrong though.

I haven't really managed to grasp all the Ruby-thingys by using it just for this one project but I do feel compelled to try it more and really see what it's all about. For one thing I'm sure, Ruby is amazingly easy when it comes to Arrays, Hashes and iterators. Iterating in Ruby is very natural and not bulky as in Java.

<strong>Annoying things</strong>

Yes, you might have seen it coming: Ruby did annoy me in certain points. Nothing very negative: anything new you're learning will end up being annoying at some point mostly due to your ignorance about how things work.

I loved the rubygems concept. Being able to install libraries with a click of a button is the way to go for someone as lazy as me! I'm a long-time lover of Debian for its apt-get tool so rubygem is for me. But I was amazingly stuck at it. It turned out that I was being affected by two apparently common issues:
<ol>
	<li>Old version of Rubygems: Ubuntu ships with an old version of Rubygems. It's not something surprising of course. The main problem here is that an old version of Rubygems couldn't simply fail or inform its own obsolescence when used in conjunction with Rubyforge. This is quite annoying and time consuming as I could not even imagine that something obsolete would try to run on new pieces of software.</li>
	<li>Where are the libraries installed by "rubygems"? I'm still a bit puzzled about this. Rubygems installs all libraries into a folder which happens to not be available to your ruby environment unless you use "require 'rubygems'" first. It took me a while to visualize this need. It also does not apply to all rubygems installed. Some of them seem to not need it for some reason (probably some environment setting on my computer). It turns out that something supposed to be simple became a little hell for a couple of hours.</li>
</ol>
<strong>Wrapping-up</strong>

I was very surprised with Ruby as an overall. You do feel like stepping on eggs a bit but the whole things starts to make a lot of sense after some time. Its own structure ends up forcing you to have good practices like a good naming convention and implementation of solid unit tests. But there was more:
<ul>
	<li>The light weight of the language when it comes to cumbersome data-typing is also very enjoyable. Probably more enjoyable than I expected. It certainly does make IDE automation a little bit more difficult but it's still easier to read and eventually change manually as everything seems more compact.</li>
	<li>Arrays and Hashes are great if compared to Java. It's nice to have them available so easily instead of wrapped around some interfaces.</li>
	<li>The interactive console is great. I'm sure it saved me lots and lots of hours on my development simply because I could try it on spot. No compilation, no waiting, no creation of some crazy entry-point just for testing and then running some code. Very straight-forward, easy and fun to use.</li>
</ul>
I took in total 16 hours to complete this project from scratch. It's quite a bit considering the real size of the thing but it was amazingly little considering it's completely covered with unit-tests and that I had completely no knowledge about anything Ruby whatsoever. And this is what I mean by "from scratch" here: I did not even have Ruby installed, did not know were to start and had never seen a line of Ruby code before. Moreover, the problem at hand was not well designed (or even well decided) and I had to evolve it quite a bit on the way.

That said, I'm very anxious to try Ruby again in the near future.
