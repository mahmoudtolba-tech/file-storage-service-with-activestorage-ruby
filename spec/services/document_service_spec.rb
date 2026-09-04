require 'rails_helper'

RSpec.describe DocumentService, type: :service do
  let(:file) { fixture_file_upload(Rails.root.join('spec/fixtures/files/sample.pdf'), 'application/pdf') }
  let(:valid_params) { { title: 'Test Document', metadata: { author: 'John Doe' } } }

  describe '#create' do
    it 'creates a document with attached file' do
      service = DocumentService.new(params: valid_params, file: file)
      result = service.create

      expect(result.success?).to be true
      expect(result.document).to be_persisted
      expect(result.document.file).to be_attached
    end

    it 'fails when title is missing' do
      service = DocumentService.new(params: { title: '' }, file: file)
      result = service.create

      expect(result.success?).to be false
      expect(result.errors).to include("Title can't be blank")
    end
  end

  describe '#update' do
    let!(:document) { create(:document, title: 'Old Title') }

    it 'updates attributes and replaces file when provided' do
      new_file = fixture_file_upload(Rails.root.join('spec/fixtures/files/another.pdf'), 'application/pdf')
      service = DocumentService.new(document: document, params: { title: 'New Title' }, file: new_file)
      result = service.update

      expect(result.success?).to be true
      expect(document.reload.title).to eq('New Title')
      expect(document.file.filename.to_s).to eq('another.pdf')
    end
  end
end