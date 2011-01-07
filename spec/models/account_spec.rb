# encoding: utf-8
require 'spec_helper'

describe Account do
  it { should have_many(:names) }
  it { should have_many(:portraits) }
  it { should have_many(:services) }
  it { should have_many(:sites) }
end

describe Account, '#avatar_url' do
  subject { Factory(:account) }

  context 'with portraits' do
    let!(:portrait_1) { Factory(:portrait, :account => subject, :url => '1') }
    let!(:portrait_2) { Factory(:portrait, :account => subject, :url => '2') }

    it 'returns the URL of the accounts first portrait' do
      subject.avatar.should == portrait_1
    end
  end

  context 'without portraits' do
    it 'returns the missing avatar image' do
      subject.avatar.should be_nil
    end
  end
end

describe Account, '#name, with names' do
  subject { Factory(:account) }

  let!(:english_name)  { Factory(:name, :account => subject, :value => 'Yukihiro Matsumoto') }
  let!(:japanese_name) { Factory(:name, :account => subject, :value => '松本行弘') }

  context 'in English' do
    before do
      I18n.locale = :en
    end

    it 'returns the English name of the account' do
      subject.name.should == english_name.value
    end
  end

  context 'in Japanese' do
    before do
      I18n.locale = :ja
    end

    it 'returns the Japanese name of the account' do
      subject.name.should == japanese_name.value
    end

    it 'returns the English name of the account if no Japanese name present' do
      japanese_name.destroy

      subject.name.should == english_name.value
    end
  end
end

describe Account, '#name, without names' do
  subject { Factory(:account) }

  it 'returns the username' do
    subject.name.should == subject.username
  end
end

describe Account, '#services.by_name' do
  subject { Factory(:account) }

  let!(:service) { Factory(:service, :account => subject, :name => 'twitter') }

  it 'returns service if it exists' do
    subject.services.by_name('twitter').should == service
  end

  it 'returns nil if it does not exist' do
    subject.services.by_name('facebook').should be_nil
  end
end

describe Account, '#website' do
  subject { Factory(:account) }

  context "with sites" do
    let!(:site_1) { Factory(:site, :account => subject) }
    let!(:site_2) { Factory(:site, :account => subject) }

    it "returns the first site" do
      subject.website.should == site_1
    end
  end

  context "without sites" do
    it "returns nil" do
      subject.website.should be_nil
    end
  end
end
