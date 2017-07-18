class Request < ApplicationRecord
  belongs_to :user
  has_many :items_requests
  has_many :items, through: :items_requests
end
