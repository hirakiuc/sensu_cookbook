require 'spec_helper'

describe package('rabbitmq-server'), if: [:family] == 'redhat' do
  it { should be_installed }
end

describe service('rabbitmq-server') do
  it { should be_enabled }
  it { should be_running }
end

describe port(5671) do
  it { should be_listening }
end
