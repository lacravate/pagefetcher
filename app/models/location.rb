# model of the location as found in the extensive page description data set
class Location < ActiveRecord::Base

  # the ones we know
  MANAGED_ATTRIBUTES = %w|street city state country zip latitude longitude|.freeze

  # mass assignment
  attr_accessible *MANAGED_ATTRIBUTES.map(&:to_sym)

  # sort out parameters and shoot them
  def self.create_with_raw_data(data)
    if data.is_a? Hash
      create data.slice(*MANAGED_ATTRIBUTES)
    end
  end

end
