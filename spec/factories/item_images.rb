FactoryBot.define do

  factory :item_image do
    image    { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'no_image.png')) }
    item_id { 1 }
  end
end