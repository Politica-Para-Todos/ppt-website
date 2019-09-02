# frozen_string_literal: true

class ManifestoItem < ApplicationRecord
  belongs_to :manifesto_section
  belongs_to :parent, class_name: 'ManifestoItem', foreign_key: :manifesto_item_id, optional: true

  has_many :annotations
  has_many :comments

  scope :printable, lambda { |version|
    where(type: %w[ParagraphManifestoItem HeaderManifestoItem OrderedListManifestoItem UnorderedListManifestoItem],
          version: version)
      .order('position ASC')
  }

  def render
    ''
  end
end
