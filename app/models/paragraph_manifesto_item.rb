# frozen_string_literal: true

class ParagraphManifestoItem < ManifestoItem
  def render
    "<p id='#{digest}'>#{text}</p>"
  end
end
