json.array!(@professors) do |professor|
  json.extract! professor, :id, :fname, :lname, :school, :department
  json.url professor_url(professor, format: :json)
end
