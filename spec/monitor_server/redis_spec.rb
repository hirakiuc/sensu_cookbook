require 'spec_helper'

describe service('redis6379') do
  it { should be_enabled }
  it { should be_running }
end

describe port(6379) do
  it { should be_listening }
end

describe command('redis-server --version') do
  its(:stdout) { should match(/^Redis server/) }
end
