---
title: The Longest Installation Ever - A Saga
layout: post
---
I got this tiny, cheap, fancy netbook in the streets of Beijing for 
my son. Of course I was not expecting tons of performance or any 
warranty longer than 5 minutes but, c'mon, it's just a netbook for a 
9 years-old. After bargaining with lots of mimics I departed home 
being a pround owner of a 100 bucks mini computer.

No doubt I as planning to install Linux on it. Not only it had a 
pirated version of Windows XP on it but it was in Chinese. The first 
pendrive I plugged into it came out with at least a dozen different 
viruses in it so I figured it was about time to start from scratch 
with a nice Linux distro.

Even though I have, not gladly I must confess, installed almost 500 
computers OSs in my life, this singular machine was so difficult and 
took me so many hours that I've figured it must have been the longest 
installation ever on the face of planet Earth. 

This account tries to summarize the ????? long weeks that I spent 
setting this computer up.

*ROUND 1 - The %!"@%& pendrives*

These new netbooks have no CD/DVD drive which is kind of great - I 
never use then anyway. But of course that meant I would have to 
install an OS via a pendrive and it posed an immediate problem: I had 
none. Since I was in Beijing, I just went to the first computer booth 
and bought the cheapest pendrive they had there.

I had never configured a pendrive to be bootable (since I never 
actually cared about it) and ended up bricking the only one I had 
bought. Or so I thought. I went back to the store and couldn't find 
the booth I had bought the pendrive so ended up buying a second one. 
At least they are cheap in China.

Back home I realized that the second pendrive was very excentric to 
say the least. It would mess up random bits all over the place in 
completelly unexpected times. It took me a couple of days to realize 
that the problem was the faulty pendrive instead of my young, 
but still-growing experience in creating bootable pendrives.

Straight to a big store back in Finland and bought the most expensive 
pendrive available. Five minutes back home and I was finally booting 
the netbook with something.

*Lesson learnt 1:* never, never, never buy pendrives in China! They 
may be cheap, they may look like the reall thing and may look like 
they work but stay away from them.

*Lesson learnt 2:* do not trust pendrives - part of the time I spent 
on this issue was due to the fact I couldn't believe pendrives could 
fail so drastically.

*ROUND 2 - Non-existant LiveCD*

I've been spoilt during the last couple of years to simply accept an 
installation that would come out of a LiveCD. Ubuntu's one simply did 
not work in this netbook. The whole display configuration 
automatically probed by the LiveCD did not work.

The logical step was to "downgrade" to the Alternate CD image and 
install in text mode. It remembered me some dark times in last 
century but it was still fine and fun. I had spent just too much time 
with broken pendrives so seen some funny ASCII-art in an effort to 
make my text installation less boring was, to say the least, 
entertaining.

The installation went smooth but then X failed to start showing up 
the same faulty behaviour as the LiveCD was showing before.

*Lesson learnt 3:* if the LiveCD does not work, the final 
installation will most certainly not work as well. I'm sure some will 
disagree with this affirmation though.

*ROUND 3: Of course, the video driver*

My brief progress had come to a huge halt. The last time I struggled 
with display settings problems was in 2003 trying to salvage an old 
1996 notebook and I did not like the experience.

The nightmare from 2003 started up in much worst shape. For starters, 
the embedded video device has 3 different driver implementations. Two 
of them nativelly supported by Ubuntu. X was probing for the most 
common and apparently more stable one: "openchrome". I tried "via" 
and got X to jam. "openchrome" would at least start X with very 
flashy, distorted and oscilating images that would trigger some 
epilepitc events for some.

I then moved to "vesa" since, well, theoratically anything should 
work on vesa right? Wrong! X hangs with a blinking cursor. No log is 
added to Xorg.0.log or, in fact, anywhere else. It's just a 
frustrating blinking cursor.

Accidentally I booted with Damn Small Linux which was in the pendrive 
and it worked wonderfully well. I suddenly realized that Xorg with 
vesa drivers was simply not the same was using Xvesa directly. Of 
course DSL uses Xvesa to achieve a smaller memory footprint but, at 
the same time, it was working in my target computer instead of Xorg 
with a vesa driver.

This would be a quick solve then right? You simply change Xorg to 
Xvesa and voi a la: you have a working system! Not so simple though. 
Since Xvesa is just too simple this is not a common move. You can't 
find many threads of people doing this on the Internet. If they do, 
they normally opt for using a distro which uses Xvesa as a default. 
It was not my case: I wanted Ubuntu to be Xvesa and, no wonder, it 
was not in the repositories or anywhere on the web on how to do it.

*Lesson learnt 4:* being against the majority sucks - other people 
trying to find support for this same problem simply got feedbacks 
like "vesa driver should work in Xorg"... a big highlight in the 
"should" part.

*ROUND 3 - It's the monitor settings then* 

Logical next step: my refresh rate, color depth or some other bizarre 
modeline in Xorg.conf must be set. I started with the basic numbers 
and combinations and, out of hours of insuccess, migrated to the more 
exotic combinations.

I was still alternating between "via", "openchrome" and "vesa" 
drivers hoping that a certain combination would magically work. No 
avail. After 4 hours playing with this I decided it was time for a 
valuable but at the same time obvious lesson...

*Lesson learnt 5:* do not bang your head on the wall for too long - 
you might get hurt.

*ROUND 4 - The supplier must have the specs*

The netbook has a very nice Fujitsu sticker on it's LCD lid so I 
quickly pointed the Fujitsu's site to immediatlely find out that the 
netbook I had in front of me did not exist. Not only it did not exist 
but I also realized it had no model number anywhere to be seen.

Those witty Chinese might have done something to fool me into 
thinking that the computer was produced by Fujitsu.

I was almost sure this was the case and decided to Google based on 
the ony part number that was somehow visible somewhere: the battery's 
one. Eureka: some people were selling replacement batteries in eBay 
and they mentioned the notebook they referred to: an Everex 
CloudThink. I finally had somewhere to look at.

There was a problem though: Everex had just closed their operations 
in the US and, for that matter, decided to remove their site in 
English and kept only a version in Japanese. It also took me a lot of 
guessing to realize that the CloudThink model I had purchased was 
actually only sold in Japan and, as such, Everex never cared 
publishing a tint of information in English. It was also very 
surprising that I would find a unit being sold in China since, well, 
these notes should not be there... and should not be sold with a 
Fujitsu sticker on them by the way.

After this long - a quite crazy - research round I finally got all 
the specs I did NOT need: only the screen resolution which I had 
already guessed right. No information about refresh rate, syncing, 
color-depth or anything else for that matter.

*Lesson learnt 6:* never trust a product bought in China (hey, wasn't 
that lesson 1 as well? - well kind of).

*Lesson learnt 7:* learn Chinese, Japanese or some of these cryptic 
languages in your free time - it will help you very much in 
deciphring these crazy things.

*ROUND 5 - Ok, let's keep it simple then*

I was almost giving up but one of my defects is being very stuborn. 
If Xvesa would work, I would then install an Xvesa distro! So I 
started shopping: the distro had to be light, simple to use, have a 
nice pakage manager and, of course, use Xvesa (just for a sanity 
check).

The chosen one was [SliTaz](www.slitaz.org) which seemed quite 
interesting and, well, installed very easily and quickly. It also had 
a slightly more amusing window manager compared with DSL (we must 
remember this netbook was targetted at an 9-year-old) and I pretty 
decent package management system that I learned in a couple of 
seconds.

SliTaz was up and running in less than 10 minutes!

*Lesson learnt 8:* KISS - keep it simple stupid!

*ROUND 6 - 
