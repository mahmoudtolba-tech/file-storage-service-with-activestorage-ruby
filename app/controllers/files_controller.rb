class FilesController < ApplicationController
  before_action :set_file, only: %i[show destroy]

  def index
    files = FileRepository.all
    render json: files
  end

  def create
    file_service = FileService.new(FileRepository.create(file_params))
    render json: file_service.upload
  end

  def show
    render json: @file
  end

  def destroy
    file_service = FileService.new(@file)
    render json: file_service.destroy
  end

  private

  def set_file
    @file = FileRepository.find(params[:id])
  end

  def file_params
    params.permit(:upload)
  end
end