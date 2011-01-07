require 'spec_helper'

describe Service do
  it { should belong_to(:account) }
end

describe Service, '#url' do
  %w(facebook friendfeed github twitter).each do |service_name|
    it "returns the correct URL for #{service_name.titleize}" do
      service = Factory.build(:service, :name => service_name, :key => 'matz')
      service.url.should == "http://#{service_name}.com/#{service.key}"
    end
  end

  it "returns the correct URL for Iddy" do
    service = Factory.build(:service, :name => 'iddy', :key => 'matz')
    service.url.should == "http://iddy.jp/profile/#{service.key}"
  end

  it "returns the correct URL for Mixi" do
    service = Factory.build(:service, :name => 'mixi', :key => '1234')
    service.url.should == "http://mixi.jp/show_friend.pl?id=#{service.key}"
  end

  it "returns the correct URL for Facebook special case" do
    service = Factory.build(:service, :name => 'facebook', :key => '1234')
    service.url.should == "http://facebook.com/profile.php?id=#{service.key}"
  end
end
