require 'psych'
require 'openssl'
require 'open-uri'
require 'pp'

class GH
  class Lazy < Struct.new(:hash)
    def [] arg
      hash[arg]
    end

    def method_missing name
      value = hash[name.to_s]
      Hash === value ? Lazy.new(value) : value
    end
  end

  URL = 'https://github.com/api/v2/json/pulls/tenderlove/rubycommitters.org/pulls'

  def initialize
    @pulls = nil
  end

  def pulls
    return @pulls if @pulls

    doc = Psych.load open(URL, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE)
    doc['pulls'].map { |req| Lazy.new(req) }
  end

  @@gh = GH.new

  def self.pulls
    @@gh.pulls
  end
end

namespace :remotes do
  desc 'delete remotes'
  task :rm do
    (`git remote`.split($/) - %w{ origin heroku }).each do |remote|
      sh "git remote rm #{remote}"
    end
  end

  desc 'add remotes'
  task :add => :rm do
    GH.pulls.each do |request|
      remote_name = request.head.user.login
      url         = request.head.repository.url

      next if `git remote`.split($/).include? remote_name

      sh "git remote add #{remote_name} #{url}.git"
    end
  end

  desc 'fetch remotes'
  task :fetch => :add do
    (`git remote`.split($/) - %w{ origin heroku }).each do |remote|
      sh "git fetch #{remote}"
    end
  end
end

namespace :branch do
  desc 'rm all branches'
  task :rm do
    (`git branch`.split($/).map(&:strip) - ['* master']).each do |branch|
      sh "git branch -D #{branch}"
    end
  end

  desc 'create branches for entries'
  task :entries => ['branch:rm', 'remotes:fetch'] do
    GH.pulls.each do |request|
      remote_name = request.head.user.login
      label       = request.head.label.sub ':', '-'
      ref         = request.head.ref.sub(':', '-')

      next if `git branch`.split($/).map(&:strip).include?(label)

      sh "git checkout -b #{label} #{remote_name}/#{ref}"
    end

    sh "git checkout master"
  end
end
