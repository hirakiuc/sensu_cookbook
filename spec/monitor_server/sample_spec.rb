require 'spec_helper'

describe package('sensu') do
  it { should be_installed }
end

describe service('sensu-server') do
  it { should be_enabled }
  it { should be_running }
end

describe service('sensu-api') do
  it { should be_enabled }
  it { should be_running }
end

describe service('sensu-client') do
  it { should_not be_enabled }
  it { should_not be_running }
end
