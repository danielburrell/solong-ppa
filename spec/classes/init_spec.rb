require 'spec_helper'
describe 'ppa' do

  context 'with defaults for all parameters' do
    it { should contain_class('ppa') }
  end
end
