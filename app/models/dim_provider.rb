class DimProvider < ApplicationRecord
  belongs_to :user, class_name: 'DimUser', foreign_key: 'dim_user_id'
  has_many :availabilities, class_name: 'DimAvailability'
end
