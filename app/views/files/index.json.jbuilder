json.array! @files do |file|
  json.extract! file, :id, :file
end