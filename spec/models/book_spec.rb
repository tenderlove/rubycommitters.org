require 'spec_helper'

describe Book do
  it { should belong_to(:account) }
end
