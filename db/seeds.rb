# Seed data for development/testing

puts "Seeding sample files..."

# Create a few dummy files using Faker
require "open-uri"

5.times do
  filename = Faker::File.file_name(ext: %w[png jpg pdf])
  content_type = case File.extname(filename)
                 when ".png" then "image/png"
                 when ".jpg", ".jpeg" then "image/jpeg"
                 when ".pdf" then "application/pdf"
                 else "application/octet-stream"
                 end
  file = Tempfile.new(filename)
  file.binmode
  file.write(Faker::LoremFlickr.image(size: "300x300", search_terms: ["nature"])) if content_type.start_with?("image")
  file.write(Faker::Lorem.paragraph(sentence_count: 5)) if content_type == "application/pdf"
  file.rewind

  uploaded_file = ActionDispatch::Http::UploadedFile.new(
    filename: filename,
    type: content_type,
    tempfile: file
  )

  begin
    FileUploadService.new.call(uploaded_file)
    puts "Created #{filename}"
  rescue => e
    puts "Failed to create #{filename}: #{e.message}"
  ensure
    file.close
    file.unlink
  end
end