require 'spec_helper'

describe package('elasticsearch'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end

describe service('elasticsearch'), :if => os[:family] == 'ubuntu' do
  it { should be_enabled }
  it { should be_running }
end

describe file('/opt/kibana-4.0.0-BETA2/bin/kibana') do
  it { should be_executable }
end

describe service('kibana'), :if => os[:family] == 'ubuntu' do
  it { should be_enabled }
  it { should be_running }
end

[9200, 9300, 5601].each do |lport|
  describe port(lport) do
    it { should be_listening }
  end
end
