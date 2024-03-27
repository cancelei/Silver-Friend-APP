class DimAvailability < ApplicationRecord
  belongs_to :provider, class_name: 'DimProvider'
  belongs_to :service, class_name: 'DimService'
end
