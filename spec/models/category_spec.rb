require 'spec_helper'

describe Category do

  describe 'validations' do
    it { should validate_presence_of :external_id }
    it { should validate_presence_of :name }
  end

end

