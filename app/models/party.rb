# frozen_string_literal: true

class Party < ApplicationRecord
  has_many :manifestos
end
