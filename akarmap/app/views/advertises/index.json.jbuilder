json.array!(@advertises) do |advertise|
  json.extract! advertise, :id, :desc, :type, :city, :address, :user_id
  json.url advertise_url(advertise, format: :json)
end
