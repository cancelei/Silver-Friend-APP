# app/models/dim_user.rb
class DimUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :provider, class_name: 'DimProvider', foreign_key: 'dim_user_id'

  enum account_type: { consumer: 0, provider: 1 }

  validates :account_type, presence: true, inclusion: { in: account_types.keys }
end
