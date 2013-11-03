require 'spec_helper'

describe KeyMastersController do

  let(:master) { double }
  let(:code) { 'the_code' }
  let(:token) {
    Yasify.new(ENV['FACEBOOK_CONFIG']).save token: 'plop'
    'plop'
  }

  describe "new" do

    before {
      subject.instance_variable_set "@key_master", master
      master.stub(:set_token_with).with(code).and_return(token)

      get 'new', code: code
    }

    it "should have persisted a now token" do
      KeyMaster.new.got_keys?.should be_true
    end

    it "should end up in a redirect" do
      response.should redirect_to('/')
    end
  end

end
