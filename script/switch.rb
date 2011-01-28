#!/usr/bin/env ruby

username = ARGV[0]
`git checkout Gemfile.lock`
puts `git remote add #{username} git://github.com/#{username}/rubycommitters.org`
puts `git fetch #{username}`
puts `git checkout #{username}/master`
puts `bundle install`
exec `script/rails server -p 3099`
