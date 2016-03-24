require 'spec_helper'
describe 'foreman_reports' do

  context 'with defaults for all parameters' do
    it { should contain_class('foreman_reports') }
  end
end
