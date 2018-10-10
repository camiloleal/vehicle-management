# frozen_string_literal: true
require 'csv'

class Vehicle < ApplicationRecord
  belongs_to :person

  validates :plate, :branch, :category, presence: true
  validates :plate, uniqueness: true, length: { maximum: 6 }

  REPORT_TYPES = ['vehicles', 'vehicles_branches', 'vehicles_branches_quantity'].freeze

  def self.permited_type?(type)
    REPORT_TYPES.include? type
  end

  def self.report(type, options = {})
    send(type, options)
  end

  def self.vehicles(options)
    attributes = %w{plate branch category}

    CSV.generate(options) do |csv|
      csv << %w{Placa Marca Tipo}

      all.each do |vehicle|
        csv << attributes.map{ |attr| vehicle.send(attr) }
      end
    end
  end

  def self.vehicles_branches_quantity(options)
    branches = Vehicle.group(:branch).count

    CSV.generate(options) do |csv|
      csv << %w{Marca Cantidad}

      branches.each do |branch, quantity|
        csv << [branch, quantity]
      end
    end
  end

  def self.vehicles_branches(options)
    attributes = %w{plate category}
    branches = Vehicle.all.group_by(&:branch)

    CSV.generate(options) do |csv|
      branches.each do |branch, vehicles|
        csv << %w{Marca Placa Tipo}

        vehicles.each_with_index do |vehicle, index|
          csv << [branch] + attributes.map{ |attr| vehicle.send(attr) }
        end
      end
    end
  end
end
