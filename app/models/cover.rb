# model of the cover as found in the extensive page description data set
class Cover < ActiveRecord::Base

  extend SortOutParams

  # fields validations
  validates_presence_of :external_id
  validates_presence_of :source

  # the ones we identified so far
  MANAGED_ATTRIBUTES = %w|external_id source offset_x offset_y|.freeze

  # mass assignment
  attr_accessible *MANAGED_ATTRIBUTES.map(&:to_sym)

  private

  # teeny tiny modification on data before shooting
  def self.chipchip(data)
    data.tap do |d|
      d['external_id'] = d.delete 'cover_id'
    end
  end

end
