# frozen_string_literal: true

class ListItemManifestoItem < ManifestoItem
  def render
    "<li id='#{digest}'>#{content}</li>"
  end
end
