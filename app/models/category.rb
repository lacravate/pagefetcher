# model of the category as found in the extensive page description data set
class Category < ActiveRecord::Base

  extend SortOutParams

  # relations
  has_and_belongs_to_many :pages

  # fields validations
  validates_presence_of :external_id
  validates_presence_of:name

  # these are the one we know so far
  MANAGED_ATTRIBUTES = %w|external_id name|.freeze

  # mass assignment is handy
  attr_accessible *MANAGED_ATTRIBUTES.map(&:to_sym)

  private

  # teeny tiny modification on data before shooting
  def self.chipchip(data)
    data.tap do |d|
      d['external_id'] = d.delete 'id'
    end
  end

end
