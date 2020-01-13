# frozen_string_literal: true

class Request < ApplicationRecord
  enum status: %i[wanted complated]

  validates :product_name, presence: true
  validates :repository_url, format: /\A#{URI::regexp(%w(http https))}\z/, presence: true
  validates :status, presence: true
end
