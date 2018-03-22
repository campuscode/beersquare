FactoryBot.define do
  factory :beer do
    name 'KBS 2016'
    brewery 'Founders Brewing'
    style 'Imperial Russial Stout'
    abv 11.9
    ibu 70
    nationality 'American'
    available_in 'can, bottle'
    description 'Descrição da cerveja maravilhosa'

  end
end
