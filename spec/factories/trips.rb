FactoryGirl.define do
  factory :trip do
    location_name "London, UK"
    latlong [51.5072, 0.1275]
    duration_days 14
    name "Fun Trip!"
  end
end
