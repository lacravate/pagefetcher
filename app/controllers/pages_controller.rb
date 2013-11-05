class PagesController < ApplicationController

  before_filter :key_master_ready?, except: %i|create|

  # well, the feeds are not dependant of the page ?
  # nah... they are not persisted, so they are just a collections
  def show
    @page = Page.find params[:id]
    @feeds = @key_master.feeds(@page.external_id)[0..9]
  rescue
    # API calls have their own damage control mechanism
    # this is only to avoid any quirky things with a messy page id
    redirect_to root_url
  end

  # What ?
  def new; end

  # we get an id or a name ?
  # we let the Key Master see what he can do, and no matter what, we go back home
  def create
    @key_master.to_page params['page'][:external_id] if params['page'][:external_id].present?

    redirect_to root_path
  end

  # fetches a FB page by id or name
  # only used to check page existence so far
  # hence the method name
  def lookup
    # gets a page (Hash) or a FB error
    page = @key_master.get_page(params[:name])
    respond_to do |format|
      format.json do
        render json: page, status: (page.is_a?(Hash) ? :ok : :not_found)
      end
    end
  end

end
