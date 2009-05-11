--- 
wordpress_id: 962
title: Why everything should be in version control
wordpress_url: http://www.tiagoluchini.eu/?p=962
layout: post
---
I hear a lot of criticism because of my decision to have project documentation stationed somewhere in the project's version control system. "Version control systems should be used for source-code only" is the kind of thing people tell me all the time.

I am fully aware of the limitations of source control systems when it comes to binary files and I am also aware this is not the way most people work - but - as I see it - I am not "most people".

The thing is that this decision normally saves me a lot of trouble and I find it important to share this approach since I have just been saved by my stubbornness to keep project documentation on the version control.

I use Open WorkBench for project planning and scheduling. It has a very neat feature to save its files on XML format. As usual, this is my preferred choice wherever possible. Open WorkBench is really powerful and is a nice tool for multiple-dependency projects like the one I am currently managing. The thing is that I found a small bug on it by physically skipping some entry lines on the resource grid for organizational purposes. Open WorkBench saved a corrupt file due to this small non-predicted use-case and I did not realize this problem as I was working on the file pretty intensively and it took me a couple of days to finish.

It was pretty surprising when I tried to open the file and it would simply crash Open WorkBench.

Version control came to rescue me: I checked out older revisions and isolated the one that was definitely bringing some new variable to the system and breaking my work cycle. I diffed the XML code and found some open-ended resource entries that I manually removed and none of my work was lost. What would mean one full week of lost work suddenly became a solution in 15 minutes. Not bad!

Once again my stubbornness to use traditional development tools for project management payed back.
