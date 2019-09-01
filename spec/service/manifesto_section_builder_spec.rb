# frozen_string_literal: true

require 'rails_helper'

describe ManifestoSectionBuilder do
  context 'when given a markdown document' do
    let(:markdown_text) { File.read('spec/fixtures/example_text.md') }
    let(:markdown_document) { Kramdown::Document.new(markdown_text) }
    let(:manifesto_section) { create(:manifesto_section) }

    subject do
      ManifestoSectionBuilder.new(
        document: markdown_document,
        manifesto_section: manifesto_section
      )
    end

    it 'creates the required ManifestoItems inside the section' do
      subject.build

      expect(ManifestoItem.count).to eq(144)
      expect(ManifestoSection.first.version).to eq(2)

      expect(ParagraphManifestoItem.count).to eq(128)
      expect(ParagraphManifestoItem.first.version).to eq(2)

      expect(UnorderedListManifestoItem.count).to eq(3)
      expect(UnorderedListManifestoItem.first.list_items.count).to eq(4)
    end

    it 'reuses old ManifestoItems when updating the text of the section' do
      subject.build
      subject.build

      expect(ManifestoItem.count).to eq(144)
      expect(ManifestoSection.first.version).to eq(3)

      expect(ParagraphManifestoItem.count).to eq(128)
      expect(ParagraphManifestoItem.first.version).to eq(3)

      expect(UnorderedListManifestoItem.count).to eq(3)
      expect(UnorderedListManifestoItem.first.list_items.count).to eq(4)
      expect(UnorderedListManifestoItem.first.list_items.last.version).to eq(3)
    end
  end
end
