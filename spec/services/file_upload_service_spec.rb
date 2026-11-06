# frozen_string_literal: true

require "rails_helper"

RSpec.describe FileUploadService, type: :service do
  let(:title) { "Test Document" }
  let(:filename) { "test.pdf" }
  let(:file_path) { Rails.root.join("spec", "fixtures", "files", filename) }
  let(:file_io) { File.open(file_path) }

  after { file_io.close }

  describe "#call" do
    it "creates a FileRecord with attached file" do
      service = described_class.new
      record = service.call(title: title, filename: filename, file_io: file_io)

      expect(record).to be_persisted
      expect(record.title).to eq(title)
      expect(record.uploaded_file).to be_attached
    end

    context "when title is missing" do
      it "raises UploadError" do
        service = described_class.new
        expect {
          service.call(title: "", filename: filename, file_io: file_io)
        }.to raise_error(FileUploadService::UploadError, /Title cannot be blank/)
      end
    end
  end
end