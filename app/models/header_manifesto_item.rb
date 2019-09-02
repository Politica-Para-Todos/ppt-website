# frozen_string_literal: true

class HeaderManifestoItem < ManifestoItem
  def render
    "<h2 id='#{digest}'>#{content}</h2>"
  end
end
