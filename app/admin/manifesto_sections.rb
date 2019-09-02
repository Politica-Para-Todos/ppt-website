# frozen_string_literal: true

ActiveAdmin.register ManifestoSection do
  permit_params :manifesto_id, :kind, :position, :text, :version, :document_source

  form do |f|
    f.inputs 'Member Details' do
      if f.object.new_record?
        f.input :manifesto
        f.input :manifesto_section
        f.input :position
        f.input :content, label: 'Title'
      end

      f.input :document_source
    end

    f.button :Submit
  end
end
