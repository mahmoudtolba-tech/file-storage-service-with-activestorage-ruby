class FilesController < ApplicationController
  def index
    files = FileService.new.all
    render json: files
  end

  def show
    file = FileService.new.find(params[:id])
    render json: file
  end

  def create
    file = FileService.new.create(file_params)
    render json: file
  end

  def update
    file = FileService.new.update(params[:id], file_params)
    render json: file
  end

  def destroy
    FileService.new.delete(params[:id])
    head :no_content
  end

  private

  def file_params
    params.require(:file).permit(:file)
  end
end