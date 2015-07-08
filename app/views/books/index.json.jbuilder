json.array!(@books) do |book|
  json.extract! book, :id, :title, :author, :publication_date, :serial_number
  json.url book_url(book, format: :json)
end
