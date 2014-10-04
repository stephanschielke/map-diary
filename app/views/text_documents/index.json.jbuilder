json.array!(@text_documents) do |text_document|
  json.extract! text_document, :id, :filename, :content_type, :file_contents
  json.url text_document_url(text_document, format: :json)
end
