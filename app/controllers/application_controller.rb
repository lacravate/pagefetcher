class ApplicationController < ActionController::Base
  protect_from_forgery

  # a filter for a helper obkect ?
  before_filter :key_master

  # are we ready ? or bust !
  def key_master_ready?
    # the API handler has everything it needs ?
    unless @key_master.got_keys?
      # a quickie :back mechanism
      session[:back] = request.url
      # go get what you need buddy !
      redirect_to @key_master.key_board
    end
  end

  # a helper object that's not a Rails Helper'for a controller ?
  # Dunno... Thtat's how it popped out
  def key_master
    @key_master ||= KeyMaster.new
  end

end
