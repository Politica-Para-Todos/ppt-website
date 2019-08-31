# frozen_string_literal: true

json.array! @manifesto_items, partial: 'manifesto_items/manifesto_item', as: :manifesto_item
