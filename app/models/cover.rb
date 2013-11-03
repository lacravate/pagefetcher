# model of the cover as found in the extensive page description data set
class Cover < ActiveRecord::Base

  # fields validations
  validates_presence_of :external_id
  validates_presence_of :source

  # the ones we identified so far
  MANAGED_ATTRIBUTES = %w|external_id source offset_x offset_y|.freeze

  # mass assignment
  attr_accessible *MANAGED_ATTRIBUTES.map(&:to_sym)

  # sort out parameter, rationalize a bit, and go
  def self.create_with_raw_data(data)
    if data.is_a? Hash
      data['external_id'] = data.delete 'cover_id'
      create data.slice(*MANAGED_ATTRIBUTES)
    end
  end

end
