require 'spec_helper'

describe 'ssm_agent', :type => 'class' do
  context 'with defaults for all parameters' do
    let(:facts) do { 
      :osfamily => 'Debian',
    }
    end
    it do
      should contain_class('ssm_agent')
      should contain_class('ssm_agent::install')
      should contain_class('ssm_agent::config')
      should contain_class('ssm_agent::service')
    end

    it do
      should compile.with_all_deps
    end
  end
  
end