require 'spec_helper'

describe Site do
  it { should belong_to(:account) }
end
