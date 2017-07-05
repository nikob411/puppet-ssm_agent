require 'spec_helper_acceptance'

describe 'install ssm_agent' do
  context 'default parameters with ssm_agent' do
    it 'should install package' do
      pp = "class { 'ssm_agent': }"

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end
  end
end
