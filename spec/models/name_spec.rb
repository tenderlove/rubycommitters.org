require 'spec_helper'

describe Name do
  it { should belong_to(:account) }
end

describe Name, '.in_english' do
  let!(:english_name)  { Factory(:name, :value => 'Yukihiro Matsumoto') }
  let!(:japanese_name) { Factory(:name, :value => '松本行弘') }

  it "returns only english names" do
    Name.in_english.should == [english_name]
  end
end

describe Name, '.in_japanese' do
  let!(:english_name)  { Factory(:name, :value => 'Yukihiro Matsumoto') }
  let!(:japanese_name) { Factory(:name, :value => '松本行弘') }

  it "returns only japanese names" do
    Name.in_japanese.should == [japanese_name]
  end
end

describe Name, '#value' do
  subject { Factory(:name, :value => 'TRISTAN DuNN') }

  it "returns the value in proper case" do
    subject.value.should == 'Tristan Dunn'
  end
end
