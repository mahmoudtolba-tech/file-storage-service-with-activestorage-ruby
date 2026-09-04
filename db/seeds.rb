# Seed sample documents
5.times do
  doc = Document.create!(
    title: Faker::Lorem.sentence(word_count: 3),
    metadata: { author: Faker::Name.name, description: Faker::Lorem.paragraph }
  )
  file_path = Rails.root.join('app', 'assets', 'images', 'sample.png')
  if File.exist?(file_path)
    doc.file.attach(io: File.open(file_path), filename: "sample_#{doc.id}.png", content_type: 'image/png')
  end
end