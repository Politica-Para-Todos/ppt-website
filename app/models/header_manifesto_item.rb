# frozen_string_literal: true

class HeaderManifestoItem < ManifestoItem
  def render
    "<h2 id='#{digest}'>#{text}</h2>"
  end
end
