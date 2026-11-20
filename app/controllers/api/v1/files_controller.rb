# frozen_string_literal: true

module Api
  module V1
    class FilesController < ApplicationController
      # Skip CSRF for API usage; in production ensure proper auth.
      protect_from_forgery with: :null_session

      before_action :set_file_record, only: %i[show destroy]

      # GET /api/v1/files
      def index
        records = repository.all
        render json: records.map { |r| serialize(r) }, status: :ok
      end

      # POST /api/v1/files
      def create
        unless params[:file].present?
          render json: { error: "Missing file parameter" }, status: :bad_request and return
        end

        service = FileUploadService.new(repository: repository)
        result = service.call(params[:file])

        render json: result, status: :created
      rescue ArgumentError => e
        render json: { error: e.message }, status: :unprocessable_entity
      rescue StandardError => e
        Rails.logger.error "Unexpected error in FilesController#create: #{e.message}"
        render json: { error: "Internal server error" }, status: :internal_server_error
      end

      # GET /api/v1/files/:id
      def show
        redirect_to @file_record.signed_url, allow_other_host: true
      end

      # DELETE /api/v1/files/:id
      def destroy
        repository.delete(@file_record.id)
        head :no_content
      rescue StandardError => e
        Rails.logger.error "Failed to delete file #{params[:id]}: #{e.message}"
        render json: { error: "Unable to delete file" }, status: :internal_server_error
      end

      private

      def repository
        @repository ||= FileRepository.new
      end

      def set_file_record
        @file_record = repository.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "File not found" }, status: :not_found
      end

      def serialize(record)
        {
          id: record.id,
          filename: record.filename,
          content_type: record.content_type,
          byte_size: record.byte_size,
          url: record.signed_url
        }
      end
    end
  end
end