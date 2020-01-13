# frozen_string_literal: true

class Request < ApplicationRecord
  enum status: %i[wanted complated]
  validates :repository_url, format: /\A#{URI::regexp(%w(http https))}\z/
end
