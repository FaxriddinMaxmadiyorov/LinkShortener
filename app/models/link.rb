class Link < ApplicationRecord
  validates :lookup_code, :original_url, presence: true
  validates :lookup_code, uniqueness: true
end
