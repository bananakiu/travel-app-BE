class MyValidator < ActiveModel::Validator
  def end_date_after_start_date?
    if end_date < start_date
      errors.add :end_date, "must be after start date"
    end
  end
  end  

class Roll < ApplicationRecord
  belongs_to :user
  has_many :entries
  accepts_nested_attributes_for :entries, allow_destroy: true
  validates_with MyValidator
end