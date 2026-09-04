# Service object handling business logic for Document creation and update.
class DocumentService
  Result = Struct.new(:success?, :document, :errors)

  def initialize(document: nil, params:, file:)
    @document = document || Document.new
    @params = params
    @file = file
  end

  def create
    assign_attributes
    attach_file
    if @document.save
      Result.new(true, @document, nil)
    else
      Result.new(false, nil, @document.errors.full_messages)
    end
  rescue => e
    Rails.logger.error "DocumentService#create error: #{e.message}"
    Result.new(false, nil, [e.message])
  end

  def update
    assign_attributes
    attach_file if @file.present?
    if @document.save
      Result.new(true, @document, nil)
    else
      Result.new(false, nil, @document.errors.full_messages)
    end
  rescue => e
    Rails.logger.error "DocumentService#update error: #{e.message}"
    Result.new(false, nil, [e.message])
  end

  private

  def assign_attributes
    @document.assign_attributes(@params)
  end

  def attach_file
    @document.file.attach(@file)
  end
end