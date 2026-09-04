class DocumentsController < ApplicationController
  before_action :set_document, only: %i[show update destroy]

  # GET /documents
  def index
    documents = DocumentRepository.new.all
    render json: documents.as_json(only: %i[id title created_at updated_at], methods: :file_url), status: :ok
  end

  # GET /documents/:id
  def show
    render json: @document.as_json(only: %i[id title created_at updated_at], methods: :file_url), status: :ok
  end

  # POST /documents
  def create
    service = DocumentService.new(params: document_params, file: params[:file])
    result = service.create

    if result.success?
      render json: result.document.as_json(methods: :file_url), status: :created
    else
      render json: { errors: result.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /documents/:id
  def update
    service = DocumentService.new(document: @document, params: document_params, file: params[:file])
    result = service.update

    if result.success?
      render json: result.document.as_json(methods: :file_url), status: :ok
    else
      render json: { errors: result.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /documents/:id
  def destroy
    @document.destroy
    head :no_content
  end

  private

  def set_document
    @document = DocumentRepository.new.find(params[:id])
    render json: { error: 'Not Found' }, status: :not_found unless @document
  end

  def document_params
    params.permit(:title, metadata: {})
  end
end