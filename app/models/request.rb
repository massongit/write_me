# frozen_string_literal: true

class Request < ApplicationRecord
  enum status: %i[wanted complated]
end
