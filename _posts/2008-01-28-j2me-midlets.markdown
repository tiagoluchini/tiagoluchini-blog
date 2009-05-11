--- 
wordpress_id: 783
title: J2ME Midlets
wordpress_url: http://www.tiagoluchini.eu/2008/01/28/j2me-midlets/
layout: post
---
As usual, I have just finished a project using J2ME (and its related CLDC 1.1 and MIDP 2.0) and have some comments about it.

I am quite impressed by the platform. It is very simple to use and, at the same time, quite powerful. Of course there are some annoyances like the fact that you do not have an IO subsystem at your disposal and that you frequently stumble across limitations like the absence of a n object cloning method. But these scenarios are very simple to be overcame by different means (RMS for the first and some manual cloning for the second).

The MIDP 2.0 extensions are very interesting. Specially when it comes to SMS and other data packages integration. I was pretty surprised by the full extent of the implementation.

Of course that a recurrent annoyance when dealing with MIDP is to prepare your application for threading. If you don't do it, your application pretty much loses a lot of responsiveness.

The final rendering decision made by the target implementation is very reasonable and, yes, it is a little limited from the designer's perspective but it is still very much usable when you put some creativity into it.

The platform's support for accessing secured resources, code signing and several deployment strategies is just fantastic. The whole OTA (Over-The-Air) deployment strategy is, per se, a very nice feat.

By the end of the day, Sun really did a very good job with its J2ME. Some recommendation though should be taken into account:

<strong>1) Prepare your application for threading</strong>

That is not an option. You will have the face this issue sooner or later (better sooner - I realized).

<strong>2) Use some optimization/obfuscation strategy</strong>

We decided to use ProGuard and had amazing results. Our final code was reduced from 190B to 85KB. Some tweaking is obviously required and your application must be prepared for it (avoid - by all means possible - using class names in Strings for instance).

<strong>3) Bear in mind your target deployment environment</strong>

Mobile devices are powerful but not soooo powerful. Bear in mind that your application might be optimized not only with a tool like ProGuard but that you may also need to choose correct algorithms in your logic.
