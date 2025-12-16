# frozen_string_literal: true
class FilesController < ApplicationController
  before_action :set_file, only: %i[show update destroy]

  def index
    @files = FileService.new.list_files
    render json: @files
  end

  def show
    render json: @file
  end

  def create
    @file = FileService.new.create_file(file_params)
    if @file.valid?
      render json: @file, status: :created
    else
      render json: @file.errors, status: :unprocessable_entity
    end
  end

  def update
    if @file.update(file_params)
      render json: @file
    else
      render json: @file.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @file.destroy
    head :no_content
  end

  private

  def set_file
    @file = FileService.new.get_file(params[:id])
  end

  def file_params
    params.require(:file).permit(:name, :file_data)
  end
end