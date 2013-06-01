require 'open-uri'

desc "import the list of ruby committers"
task :import => 'db:migrate' do
  Account.import open('https://raw.github.com/yugui/rubycommitters/master/ruby-committers.yml')
end

desc "missing images"
namespace :images do
  task :missing => 'environment' do
    usernames = Portrait.find(:all, :include => :account).map(&:account).map(&:username).uniq

    photodir = File.join Rails.root, 'public', 'images', 'people', 'photos'
    missing = Dir.chdir(photodir) do
      usernames - Dir['*'].map { |x|
        File.basename(File.basename(x, '.jpg'), '.png')
      }
    end

    Account.find_all_by_username(missing).each do |account|
      account.portraits.each do |portrait|
        p account.username => portrait.url
      end
    end
  end
end
