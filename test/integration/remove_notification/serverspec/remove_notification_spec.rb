require 'spec_helper'

describe file('/tmp/test.cancelled') do
  it { should_not be_file }
end

describe file('/tmp/test.kept') do
  it { should be_file }
end
