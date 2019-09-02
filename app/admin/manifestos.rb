# frozen_string_literal: true

ActiveAdmin.register Manifesto do
  permit_params :title

  show do
    attributes_table do
      row :title
      row :create_at
      row :updated_at

      table_for manifesto.manifesto_sections.order('position ASC') do
        column 'Sections' do |manifesto_section|
          link_to manifesto_section.text, [:admin, manifesto_section]
        end
      end
    end
  end
end
