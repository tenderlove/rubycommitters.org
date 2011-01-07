require 'spec_helper'

describe Portrait do
  it { should belong_to(:account) }
end
