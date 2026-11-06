# frozen_string_literal: true

# Seed a sample file record (requires a file present in db/seeds/files)
sample_path = Rails.root.join("db", "seeds", "files", "sample.pdf")
if File.exist?(sample_path)
  FileRecord.create!(
    title: "Sample PDF",
    filename: "sample.pdf"
  ).uploaded_file.attach(
    io: File.open(sample_path),
    filename: "sample.pdf",
    content_type: "application/pdf"
  )
  puts "Seeded sample file record."
else
  puts "No sample file found; skipping seed."
end