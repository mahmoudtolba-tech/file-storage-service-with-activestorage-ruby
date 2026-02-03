class FileService
  def initialize(file)
    @file = file
  end

  def upload
    if @file.upload.attached?
      { success: true, message: 'File uploaded successfully' }
    else
      { success: false, message: 'Error uploading file' }
    end
  end

  def destroy
    if @file.destroy
      { success: true, message: 'File deleted successfully' }
    else
      { success: false, message: 'Error deleting file' }
    end
  end
end