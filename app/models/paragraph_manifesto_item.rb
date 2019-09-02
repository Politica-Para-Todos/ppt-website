# frozen_string_literal: true

class ParagraphManifestoItem < ManifestoItem
  def render
    "<p id='#{digest}'>#{content}</p>"
  end
end
