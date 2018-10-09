# frozen_string_literal: true

class Person < ApplicationRecord
  has_many :vehicles, dependent: :destroy

  validates :name, :document_number, presence: true
  validates :document_number, uniqueness: true

  mount_uploader :document_file, DocumentUploader
  mount_base64_uploader :document_file, DocumentUploader
end
