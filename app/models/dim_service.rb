class DimService < ApplicationRecord
  has_many :availabilities, class_name: 'DimAvailability'
end
