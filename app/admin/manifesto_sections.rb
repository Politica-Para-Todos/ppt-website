# frozen_string_literal: true

ActiveAdmin.register ManifestoSection do
  permit_params :manifesto_id, :kind, :position, :text, :version, :markdown_document

  form do |f|
    f.inputs "Member Details" do
      if f.object.new_record?
        f.input :manifesto
        f.input :manifesto_section
        f.input :position
        f.input :text, label: 'Title'
      end
      f.input :markdown_document, as: :text

    end
    f.button :Submit
  end

end
