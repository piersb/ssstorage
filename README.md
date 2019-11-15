# README

A web (and perhaps in the future command-line) interface to Amazon s3 and other storage instances, for the purpose of getting our RPG audio logs off of my computer and freeing up some space.

I can't imagine there'll be a great number of people needing this itch scratched, but feel free to fork if so.

Some of the user/login code was originally from Michael Hartl's Ruby on Rails Tutorial.

Licenced using the MIT Licence - https://github.com/piersb/ssstorage/blob/master/LICENSE

New: Now with added vagrant.

* Clone to local
* vagrant up and type your password when requested
* vagrant ssh
* cd /vagrant
* bundle install --without production
* rails -b 0.0.0.0

And with luck you should now have a running website on localhost:3000
