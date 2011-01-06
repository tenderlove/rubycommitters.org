desc "import the list of ruby committers"
task :import => ['ar:drop', 'ar:migrate'] do
  require 'open-uri'
  require 'fileutils'
  FileUtils.rm_rf File.join(Padrino.root, 'public', 'images', 'portraits')
  Hero.import open('http://svn.coderepos.org/share/lang/ruby/ruby-committers/ruby-committers.yml')
end
