# model of the location as found in the extensive page description data set
class Location < ActiveRecord::Base

  extend SortOutParams

  # the ones we know
  MANAGED_ATTRIBUTES = %w|street city state country zip latitude longitude|.freeze

  private

  # mass assignment
  attr_accessible *MANAGED_ATTRIBUTES.map(&:to_sym)

end
