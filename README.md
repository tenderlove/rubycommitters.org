# rubycommitters.org

This is the source code for the rubycommitters.org website.

## Hacking

First clone the repo:

    $ git clone git://github.com/tenderlove/rubycommitters.org.git
    $ cd rubycommitters.org

Then import committer data

    $ bundle install
    $ padrino rake import

Start your server

    $ padrino start

Have fun hacking!
