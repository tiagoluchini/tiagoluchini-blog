#!/bin/sh

cd /home/tiagoluchini/tiagoluchini-blog
git pull origin master
/home/tiagoluchini/.gem/ruby/1.8/bin/jekyll /home/tiagoluchini/tiagoluchini-blog/ /home/tiagoluchini/tiagoluchini.eu --no-auto
