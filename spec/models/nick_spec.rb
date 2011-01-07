require 'spec_helper'

describe Nick do
  it { should belong_to(:account) }
end
