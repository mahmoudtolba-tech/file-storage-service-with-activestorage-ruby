# frozen_string_literal: true

module Api
  module V1
    class FileRecordsController < ApplicationController
      # Using built‑in Rails rescue_from for standardized error responses
      rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
      rescue_from FileUploadService::UploadError, with: :render_bad_request

      # POST /api/v1/file_records
      def create
        title = params.require(:title)
        uploaded_file = params.require(:file)

        service = FileUploadService.new
        record = service.call(
          title: title,
          filename: uploaded_file.original_filename,
          file_io: uploaded_file.tempfile
        )

        render json: { id: record.id, title: record.title }, status: :created
      end

      # GET /api/v1/file_records/:id
      def show
        record = repository.find!(params[:id])
        render json: { id: record.id, title: record.title, created_at: record.created_at }
      end

      # GET /api/v1/file_records/:id/download
      def download
        record = repository.find!(params[:id])
        if record.uploaded_file.attached?
          redirect_to rails_blob_url(record.uploaded_file, disposition: "attachment")
        else
          render_not_found
        end
      end

      # DELETE /api/v1/file_records/:id
      def destroy
        success = repository.destroy(params[:id])
        if success
          head :no_content
        else
          render_not_found
        end
      end

      private

      def repository
        @repository ||= FileRecordRepository.new
      end

      def render_not_found
        render json: { error: "Record not found" }, status: :not_found
      end

      def render_bad_request(exception)
        render json: { error: exception.message }, status: :bad_request
      end
    end
  end
end