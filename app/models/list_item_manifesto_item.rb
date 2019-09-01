# frozen_string_literal: true

class ListItemManifestoItem < ManifestoItem
  def render
    "<li id='#{digest}'>#{text}</li>"
  end
end
