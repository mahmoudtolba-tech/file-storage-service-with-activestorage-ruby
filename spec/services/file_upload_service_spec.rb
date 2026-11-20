# frozen_string_literal: true

require "rails_helper"

RSpec.describe FileUploadService, type: :service do
  let(:repository) { instance_double(FileRepository) }
  let(:service) { described_class.new(repository: repository) }

  let(:valid_file) do
    fixture_file_upload(Rails.root.join("spec", "fixtures", "files", "sample.png"), "image/png")
  end

  describe "#call" do
    context "with a valid file" do
      it "creates a record and returns metadata" do
        allow(repository).to receive(:create).and_return(
          double(
            id: 1,
            filename: "sample.png",
            content_type: "image/png",
            byte_size: valid_file.size,
            signed_url: "http://example.com/file/1"
          )
        )

        result = service.call(valid_file)

        expect(result).to include(
          id: 1,
          filename: "sample.png",
          content_type: "image/png",
          byte_size: valid_file.size,
          url: "http://example.com/file/1"
        )
        expect(repository).to have_received(:create).once
      end
    end

    context "when file is too large" do
      it "raises an ArgumentError" do
        large_file = double(
          original_filename: "big.pdf",
          content_type: "application/pdf",
          size: FileUploadService::MAX_FILE_SIZE + 1
        )
        expect { service.call(large_file) }.to raise_error(ArgumentError, /exceeds maximum size/)
      end
    end

    context "when content type is unsupported" do
      it "raises an ArgumentError" do
        bad_type_file = double(
          original_filename: "script.sh",
          content_type: "application/x-sh",
          size: 1024
        )
        expect { service.call(bad_type_file) }.to raise_error(ArgumentError, /Unsupported content type/)
      end
    end

    context "when file param is missing" do
      it "raises an ArgumentError" do
        expect { service.call(nil) }.to raise_error(ArgumentError, /Invalid file object/)
      end
    end
  end
end