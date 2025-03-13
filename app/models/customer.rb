class Customer < ApplicationRecord
  has_one_attached :image

  # Allowlist associations for ActiveAdmin search/filtering
  def self.ransackable_associations(auth_object = nil)
    ["image_attachment", "image_blob"]
  end

  # Allowlist attributes for ActiveAdmin search/filtering
  def self.ransackable_attributes(auth_object = nil)
    ["id", "full_name", "phone_number", "email", "notes", "created_at", "updated_at"]
  end
end
