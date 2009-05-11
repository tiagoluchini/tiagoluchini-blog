--- 
wordpress_id: 1044
title: Extracting MP3 from Youtube videos
wordpress_url: http://www.tiagoluchini.eu/?p=1044
layout: post
---
Here goes a simple tip on how to extract the audio of youtube videos if you use a linux box.

You will need ffmpeg to be able to proceed with these steps. If you don't have it and are on a Debian descendant box, simply type:
<pre>sudo apt-get install ffmpeg</pre>
1) Find the video on Youtube

2) Save the video file. There are a couple of options to do it but I am pretty old-school so I do it the hard way:

2a) Clean your browser's cache (if using firefox, simple press Ctrl+Shift+Del and choose "Clear Private Data"

2b) Refresh the youtube page where your video is. This will ensure that your browser re-download your video. Wait until the video has been fully downloaded.

2c) Find the biggest file on your cache (the cache folder is normally on "/home/user/.mozilla/firefox/{some code}/Cache") and copy it to something simpler to deal with. An example:

<pre>cp 11D49E9Cd01 movie.flv</pre>

3) Use ffmpeg to extract the audio as an MP3 from the video file:

<pre>ffmpeg -i movie.flv -ab 128k -acodec libmp3lame movie.mp3</pre>

The file movie.mp3 will be generated and ready to be played.
