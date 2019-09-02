# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :manifesto_item
  belongs_to :user
  belongs_to :manifesto_item, counter_cache: true
end
