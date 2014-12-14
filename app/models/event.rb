class Event < ActiveRecord::Base
  # Validation on events submitted
  validates_presence_of :name, :description, :date, :location
  validates_uniqueness_of :name
end
