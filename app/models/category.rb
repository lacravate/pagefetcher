# model of the category as found in the extensive page description data set
class Category < ActiveRecord::Base

  # relations
  has_and_belongs_to_many :pages

  # fields validations
  validates_presence_of :external_id
  validates_presence_of:name

  # these are the one we know so far
  MANAGED_ATTRIBUTES = %w|external_id name|.freeze

  # mass assignment is handy
  attr_accessible *MANAGED_ATTRIBUTES.map(&:to_sym)

  # sort out parameter, rationalize a bit, and go
  def self.create_with_raw_data(data)
    if data.is_a? Hash
      data['external_id'] = data.delete 'id'
      create data.slice(*MANAGED_ATTRIBUTES)
    end
  end

end
