class Roll < ApplicationRecord
  belongs_to :user
  has_many :entries
  accepts_nested_attributes_for :entries, allow_destroy: true
end
