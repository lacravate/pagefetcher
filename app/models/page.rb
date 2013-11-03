# the pivotal model, sticks too much to the Facebook data, but it was also
# handy to have a plain access to it
class Page < ActiveRecord::Base

  # relations
  has_one :cover, :dependent => :destroy
  has_one :location, :dependent => :destroy
  has_and_belongs_to_many :categories

  # mass-assignment
  accepts_nested_attributes_for :cover
  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :categories

  # fields validations
  validates_presence_of :external_id
  validates_presence_of :name

  MANAGED_ATTRIBUTES = %w|about awards category checkins description founded
                          is_published mission phone products talking_about_count
                          username website were_here_count external_id name link
                          likes|.freeze

  # mass assign of attributes and dependant objects
  attr_accessible :cover, :location, :categories, *MANAGED_ATTRIBUTES.map(&:to_sym)

  # sort out parameters, mass assign with the help of the other classes, and go !
  def self.create_with_raw_data(data)
    if data.is_a? Hash
      data['external_id'] = data.delete 'id'

      create data.slice(*MANAGED_ATTRIBUTES).merge(
        cover: Cover.create_with_raw_data(data['cover']),
        location: Location.create_with_raw_data(data['location']),
        categories: (data['category_list'] || []).map { |c| Category.create_with_raw_data(c) }
      )
    end
  end

end
