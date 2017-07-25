class Request < ApplicationRecord
  belongs_to :user
  has_many :items_requests
  has_many :messages
  has_many :items, through: :items_requests

  accepts_nested_attributes_for :items_requests ##############
end
