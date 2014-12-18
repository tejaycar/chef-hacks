require 'spec_helper'

describe file('/tmp/test.cancelled') do
  it { should_not be_file }
end

describe file('/tmp/test.kept') do
  it { should be_file }
end

describe file '/tmp/immediate.kept' do
  it { should be_file }
end

describe file '/tmp/immediate.cancelled' do
  it { should_not be_file }
end

describe file '/tmp/also.kept' do
  it { should be_file }
end

describe file '/tmp/checks_notifier' do
  it { should be_file }
end

describe file '/tmp/multiple_actions' do
  it { should_not be_file }
end
