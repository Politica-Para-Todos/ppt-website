# frozen_string_literal: true

class OrderedListManifestoItem < ManifestoItem
  has_many :list_items, class_name: 'ListItemManifestoItem', foreign_key: :manifesto_item_id

  def render
    '<ol>' + list_items.map(&:render).join('') + '</ol>'
  end
end
