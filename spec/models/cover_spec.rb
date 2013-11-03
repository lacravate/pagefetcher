require 'spec_helper'

describe Cover do

  describe 'validations' do
    it { should validate_presence_of :external_id }
    it { should validate_presence_of :source }
  end

end

