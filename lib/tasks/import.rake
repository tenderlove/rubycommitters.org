require 'open-uri'

desc "import the list of ruby committers"
task :import => 'db:migrate' do
  Account.import open('http://svn.coderepos.org/share/lang/ruby/ruby-committers/ruby-committers.yml')
  Book.import_info_from_google
end
