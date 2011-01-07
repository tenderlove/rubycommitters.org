require 'spec_helper'

describe Name do
  it { should belong_to(:account) }
end

describe Name, '#value' do
  subject { Factory(:name, :value => 'TRISTAN DuNN') }

  it "returns the value in proper case" do
    subject.value.should == 'Tristan Dunn'
  end
end
