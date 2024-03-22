# app/models/dim_user.rb
class DimUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum account_type: { consumer: 'consumer', provider: 'provider' }

  validates :account_type, presence: true, inclusion: { in: account_types.keys }
end
