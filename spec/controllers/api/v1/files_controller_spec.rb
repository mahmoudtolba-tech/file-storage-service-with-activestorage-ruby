# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::FilesController, type: :controller do
  routes { Api::V1::Engine.routes }

  let(:repository) { instance_double(FileRepository) }
  before do
    allow(controller).to receive(:repository).and_return(repository)
  end

  describe "GET #index" do
    it "returns a list of files" do
      file1 = build_stubbed(:file_record)
      file2 = build_stubbed(:file_record)
      allow(repository).to receive(:all).and_return([file1, file2])

      get :index, format: :json

      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json.size).to eq(2)
    end
  end

  describe "POST #create" do
    let(:uploaded_file) { fixture_file_upload(Rails.root.join("spec", "fixtures", "files", "sample.png"), "image/png") }

    it "uploads a file successfully" do
      service = instance_double(FileUploadService)
      allow(FileUploadService).to receive(:new).and_return(service)
      result_hash = {
        id: 1,
        filename: "sample.png",
        content_type: "image/png",
        byte_size: uploaded_file.size,
        url: "http://example.com/files/1"
      }
      allow(service).to receive(:call).and_return(result_hash)

      post :create, params: { file: uploaded_file }, format: :json

      expect(response).to have_http_status(:created)
      json = JSON.parse(response.body)
      expect(json["filename"]).to eq("sample.png")
    end

    it "returns error when file param missing" do
      post :create, params: {}, format: :json
      expect(response).to have_http_status(:bad_request)
    end
  end

  describe "GET #show" do
    it "redirects to signed URL" do
      record = build_stubbed(:file_record, id: 42)
      allow(repository).to receive(:find).with("42").and_return(record)
      allow(record).to receive(:signed_url).and_return("http://example.com/file/42")

      get :show, params: { id: 42 }

      expect(response).to have_http_status(:found)
      expect(response.location).to eq("http://example.com/file/42")
    end
  end

  describe "DELETE #destroy" do
    it "deletes the file" do
      allow(repository).to receive(:delete).with("1")
      delete :destroy, params: { id: 1 }
      expect(response).to have_http_status(:no_content)
    end

    it "returns not found when record missing" do
      allow(repository).to receive(:find).and_raise(ActiveRecord::RecordNotFound)
      delete :destroy, params: { id: 999 }
      expect(response).to have_http_status(:not_found)
    end
  end
end