# frozen_string_literal: true

json.array! @manifestos, partial: 'manifestos/manifesto', as: :manifesto
