require 'spec_helper'
describe 'ssm_agent' do
  context 'with default values for all parameters' do
    it { should contain_class('ssm_agent') }
  end
end
