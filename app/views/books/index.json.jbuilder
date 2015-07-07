json.array!(@books) do |book|
  json.extract! book, :id, :title, :author, :publication_date
  json.url book_url(book, format: :json)
end
