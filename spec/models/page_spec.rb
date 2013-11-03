require 'spec_helper'

describe Page do

  describe 'validations' do
    it { should validate_presence_of :external_id }
    it { should validate_presence_of :name }
  end

  describe 'create_with_raw_data' do
    let(:raw_data) {
      {"about"=>
        "Connecting 71.251.932 people on Facebook and Twitter. We are a Preferred Marketing Developer. Contact us: info@tigerlilyapps.com",
        "awards"=>
        "Best Web App at the Facebook Mobile Hack - London 2012\nSilver Award LeWeb09\nWinner Mini SeedCamp 2010\nFinalist SeedCamp 2010",
        "can_post"=>true,
        "category"=>"Internet/software",
        "category_list"=>
        [{"id"=>"358483060859947", "name"=>"Startup"},
        {"id"=>"152142351517013", "name"=>"Corporate Office"}],
        "checkins"=>39,
        "description"=>
        "Stand out on the Social Web!\n\nTigerlily is an intelligent social media marketing platform. We help you optimize interactions with your fans and maximize their lifetime social value. Manage your social marketing \"All in one\": Conversation, Application & Insights. \n\nWorking with more than 80 iconic brands, the company has run campaigns across 60 countries and serving 72 million people.\n\nBe Agile. Be Creative. Be Smarter.",
        "founded"=>"2009",
        "is_published"=>true,
        "location"=>
        {"street"=>"34 rue du Faubourg Saint Antoine",
        "city"=>"Paris",
        "state"=>"",
        "country"=>"France",
        "zip"=>"75012",
        "latitude"=>48.8524514543,
        "longitude"=>2.37171052506},
        "mission"=>
        "Tigerlily platform helps iconic brands optimize conversations, engage users trough rich contents or contests, and identify key communities. Now is the time to become a social media chief.\n",
        "phone"=>"+ 33 1 82 28 38 61",
        "products"=>
        "The Social Marketing Platform\nA powerful dashboard to manage all your social media campaigns according to your needs.\n\nConversations\nOptimize monitoring and posting across Facebook & Twitter.\nAutomate monitoring to filter and dispatch user contents efficiently. Optimize topics, post types and timing of your posts based on relevant KPIs and identify precisely how active and influential your users are.\n\nApplications\nCreate unique social apps to maximize impressions, acquisitions, conversions and even PR.\nCreate and manage apps that delivers on your goals. Localize and geotarget your campaigns and access users profiles, detailed insights including Google analytics.\n\nInsights\nAccess actionable metrics that helps you boost your performance dramatically.\nAccess some simple and accurate reports based on your criteria and private data. Enhance your social mix (organic, paid and earned) and compare all your Pages and their KPIs.",
        "talking_about_count"=>88,
        "username"=>"Tigerlilyapps",
        "website"=>"http://www.tigerlilyapps.com",
        "were_here_count"=>0,
        "id"=>"188091757763",
        "name"=>"Tigerlily",
        "link"=>"https://www.facebook.com/Tigerlilyapps",
        "likes"=>6932,
        "cover"=>
        {"cover_id"=>"10151609917962764",
        "source"=>
        "https://fbcdn-sphotos-b-a.akamaihd.net/hphotos-ak-ash3/s720x720/35019_10151609917962764_548551867_n.png",
        "offset_y"=>0,
        "offset_x"=>0}}
    }

    context "with all the data" do
      before {
        Page.create_with_raw_data raw_data
      }

      it "can assign and persist a page and its depenedant objects in one go" do
        Page.count.should == 1
      end
    end

    context "with part of the data" do
      before {
        Page.create_with_raw_data raw_data.except(*%w|cover category_list location|)
      }

      it "can assign and persist a page and its depenedant objects in one go" do
        Page.count.should == 1
      end
    end
  end

end
