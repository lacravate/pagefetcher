class KeyMastersController < ApplicationController

  # that's the place where we wait for the delivery of the key
  def new
    @key_master.set_token_with params[:code]

    redirect_to session[:back] || root_url
  end

end
