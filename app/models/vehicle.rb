# frozen_string_literal: true

class Vehicle < ApplicationRecord
  belongs_to :person

  validates :plate, :branch, :category, presence: true
  validates :plate, uniqueness: true, length: { maximum: 6 }
end
