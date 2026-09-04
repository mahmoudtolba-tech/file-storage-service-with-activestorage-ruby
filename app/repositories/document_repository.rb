# Repository pattern for Document data access.
class DocumentRepository
  def all
    Document.all.order(created_at: :desc)
  end

  def find(id)
    Document.find_by(id: id)
  end

  def create(attributes)
    Document.create(attributes)
  end

  def update(id, attributes)
    doc = find(id)
    doc.update(attributes) if doc
    doc
  end

  def destroy(id)
    doc = find(id)
    doc.destroy if doc
  end
end