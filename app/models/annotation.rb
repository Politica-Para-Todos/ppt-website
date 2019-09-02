# frozen_string_literal: true

class Annotation < ApplicationRecord
  belongs_to :category
  belongs_to :user
  belongs_to :manifesto_item
end
