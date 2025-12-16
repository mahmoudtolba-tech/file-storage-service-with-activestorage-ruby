# frozen_string_literal: true
File.delete_all

files = [
  { name: 'example.txt' },
  { name: 'example.pdf' },
  { name: 'example.jpg' }
]

files.each { |file| File.create(file) }