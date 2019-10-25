json.childrens do
  json.array!(@categories) do |children|
    json.id children.id
    json.name children.name
  end
end