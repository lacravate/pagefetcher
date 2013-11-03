# this was supposed to be the door handle to the API
# but as things went, it was the less preposterous to do
# the calls from here too
class KeyMaster

  # hurling in of a gazillion methods i know but
  # i'm doing things fast...
  include Rails.application.routes.url_helpers

  attr_accessor :app_id, :app_secret, :token, :last_error

  # attributes population with the Facebook config file
  # not the most intelligent thing i did, but acceptable
  def initialize(config_file=default_config_file)
    # Yasify make access to YAML file data plain stupid
    @config = Yasify.new config_file
    @config.unit.each do |k, v|
      send "#{k}=", v
    end
  end

  # this method makes the Key Master a deputy controller
  # but why not
  # fetch the data and if it went well, persist it right away
  def to_page(id)
    in_the_safe do
      Page.create_with_raw_data graph.get_object(id)
    end
  end

  # feeds from a page
  def feeds(id)
    in_the_safe do
      graph.get_connections(id, 'feed') rescue []
    end
  end

  # oauth mechanism
  def key_board
    in_the_safe do
      oauth && oauth.url_for_oauth_code
    end
  end

  # we got the token, update the YAML file, and the instance variable
  def set_token_with(code)
    in_the_safe do
      @config.save token: oauth.get_access_token(code)
      @token = @config[:token]
    end
  end

  # this suppose that we always have app_id et app_secret
  # Maybe i was too lighthearted here
  def got_keys?
    @token.present?
  end

  private

  # oauth helper
  def oauth
    in_the_safe do
      @oauth ||= Koala::Facebook::OAuth.new(app_id, app_secret, new_key_master_url(host: MY_DOMAIN))
    end
  end

  # Graph helper
  def graph
    in_the_safe do
      @graph ||= Koala::Facebook::API.new(token)
    end
  end

  # Well a pretty lousy way to spec
  def default_config_file
    ENV['FACEBOOK_CONFIG'] || Rails.root.join('config', 'facebook.yml')
  end

  # lousy again, failsafe mechanism, yet it's there and should work for now
  def in_the_safe
    yield
  rescue => error
    # do something else ? log ?
    @last_error = error
  end

end
