require 'spec_helper'

describe KeyMaster do

  let(:spec_yasify) { ENV['FACEBOOK_CONFIG'] }

  before {
    FileUtils.cp Rails.root.join('config', 'facebook.yml'), spec_yasify
  }

  its(:app_id) { should be_present }
  its(:app_secret) { should be_present }

  describe 'token' do
    before {
      y = Yasify.new spec_yasify
      y[:token] = ''
      y.save
    }

    let(:oauth) {
      double.tap do |o|
        o.stub(:get_access_token).with('plop').and_return('plop')
      end
    }

    subject {
      described_class.new(spec_yasify).tap do |master|
        master.instance_variable_set("@oauth", oauth)
      end
    }

    context "no token" do
      it "should know when it lacks data" do
        subject.got_keys?.should be_false
      end
    end

    context "token given" do
      before {
        subject.set_token_with 'plop'
      }

      it "should know when it has all it needs" do
        subject.got_keys?.should be_true
      end

      it "should be able to persist token" do
        Yasify.new(spec_yasify)[:token].should be_present
      end
    end

  end

  describe "in_the_safe" do
    before {
      subject.to_page(nil)
    }

    it "just doesn't crash" do
      subject.last_error.class.should == Koala::Facebook::ClientError
    end
  end

  after {
    FileUtils.rm_f spec_yasify
  }

end

