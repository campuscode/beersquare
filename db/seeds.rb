german_school = SchoolBeer.create(name: 'Escola Alemã')
belgian_school = SchoolBeer.create(name: 'Escola Belga')
english_school = SchoolBeer.create(name: 'Escola Inglesa')
american_school = SchoolBeer.create(name: 'Escola Americana')

style_ris = BeerStyle.create(name: 'RIS - Russian Imperial Stout', school_beer: american_school)
style_red = BeerStyle.create(name: 'Imperial Red IPA', school_beer: american_school)
style_mystery = BeerStyle.create(name: 'Mystery Ale - Charmat', school_beer: american_school)
style_neipa = BeerStyle.create(name: 'New England IPA', school_beer: american_school)
style_quad = BeerStyle.create(name: 'Belgian Quadrupel', school_beer: belgian_school)
style_gueuze = BeerStyle.create(name: 'Gueuze Lambic', school_beer: belgian_school)
style_oatmeal = BeerStyle.create(name: 'Stout Oatmeal', school_beer: english_school)
style_strong = BeerStyle.create(name: 'Strong Ale', school_beer: english_school)
style_munich = BeerStyle.create(name: 'Munich Dunkel', school_beer: german_school)
style_kristall = BeerStyle.create(name: 'Kristal Weizen', school_beer: german_school)

beers = Beer.create([
  {
    name: 'KBS 2016',
    brewery: 'Founders Brewing',
    beer_style: style_ris,
    abv: 11.9,
    ibu: 70,
    nationality: 'Americana',
    description: 'Cerveja envelhecida em barris de carvalho'
  },
  {
    name: 'KBS 2018',
    brewery: 'Founders Brewing',
    beer_style: style_ris,
    abv: 11.9,
    ibu: 70,
    nationality: 'Americana',
    description: 'Cerveja envelhecida em barris de carvalho'
  },
  {
    name: 'G Knight',
    brewery: 'Oskar Blues Brewery',
    beer_style: style_red,
    abv: 8.7,
    ibu: 60,
    nationality: 'Americana',
    description: 'Uma Red IPA em homenagem ao primeiro fabricante de cerveja artesanal da California'
  },
  {
    name: 'Belhaven Scottish Oat Stout',
    brewery: 'Belheaven Brewery',
    beer_style: style_oatmeal,
    abv: 7,
    ibu: 32,
    nationality: 'Escocesa',
    description: 'É uma cerveja escura, forte e corpo médio, com notas de café e um dulçor equilibrado'
  },
  {
    name: 'St. Bernardus Abt 12',
    brewery: 'St. Bernardus Brewery',
    beer_style: style_quad,
    abv: 10.0,
    ibu: 22,
    nationality: 'Belga',
    description: 'Uma cerveja bem marcante, encorpada, saborosa, complexa e é uma ótima escolha para uma boa comemoração'
  },
  {
    name: 'Hofbräu Dunkel,',
    brewery: 'Hofbräu',
    beer_style: style_munich,
    abv: 5.5,
    ibu: 22,
    nationality: 'Alemã',
    description: 'É uma cerveja escura, destaque para o dulçor e amargor de baixa intensidade, leve e refrescante.'
  },
  {
    name: 'Belle-Vue Gueuze',
    brewery: 'Belle-Vue Brewery',
    beer_style: style_gueuze,
    abv: 5.5,
    ibu: 5,
    nationality: 'Belga',
    description: 'Ela é muito complexa, tanto em sabores quanto nos aromas bem diversificados'
  },
  {
    name: 'Roleta Russa New England IPA',
    brewery: 'Cervejaria Campo Bom',
    beer_style: style_neipa,
    abv: 6.5,
    ibu: 64,
    nationality: 'Brasileira',
    description: 'Mais aromática que saborosa, mas tem aquela pegada das NEIPA. Maracujá e refrescância são os destaques'
  },
  {
    name: 'Fuller`s 1845',
    brewery: 'Fuller`s',
    beer_style: style_strong,
    abv: 6.3,
    ibu: 52,
    nationality: 'Inglesa',
    description: 'Equilibrio entre amargor e dulçor, leve e persistente'
  },
  {
    name: 'Weihenstephan Kristall Weissbier',
    brewery: 'Bayerische Staatsbrauerei Weihenstephan',
    beer_style: style_kristall,
    abv: 5.4,
    ibu: 16,
    nationality: 'Alemã',
    description: 'Cervejaria mais antiga do mundo, cerveja de trigo, leve, refrescante para tomar litros'
  },
  {
    name: 'Wäls',
    brewery: 'Wäls Evita',
    beer_style: style_mystery,
    abv: 8.0,
    ibu: 9,
    nationality: 'Brasileira',
    description: 'Um cerveja completamente diferente, extremamente complexa tanto em aromas quanto em sabores'
  }
])

bars = Bar.create([
  {
    name: 'EAP',
    phone: '(11) 3031-4328',
    address: 'R. Vupabussu, 305',
    neighborhood: 'Pinheiros',
    city: 'São Paulo',
    state: 'SP',
    zip_code: '05429-040',
    trading_hour: 'Domingo a Quarta: 12h / 0h - Quinta a Sábado: 12h / 1h',
    payment: 'Cartão Débito/Crédito e Dinheiro',
    rank: 'Rank',
    services: 'Servimos porções e lanches'
  },
  {
    name: 'BREWDOG',
    phone: '(11) 3032-4007',
    address: 'Rua dos Coropes, 41',
    neighborhood: 'Pinheiros',
    city: 'São Paulo',
    state: 'SP',
    zip_code: '05426-010',
    trading_hour: 'Horário: 18:00 às 00:00',
    payment: 'Cartão Débito/Crédito e Dinheiro',
    rank: 'Rank',
    services: 'Servimos porções e lanches'
  },
  {
    name: 'Taverna Medieval',
    phone: '(11) 4114-2816',
    address: 'Rua Gandavo, 456',
    neighborhood: 'Vila Clementino',
    city: 'São Paulo',
    state: 'SP',
    zip_code: '04023-001',
    trading_hour: 'Horário: das 18h00 às 23h00',
    payment: 'Cartão Débito/Crédito e Dinheiro',
    rank: 'Rank',
    services: 'Servimos porções e lanches'
  },
  {
    name: 'Ambar Craft Beers',
    phone: '(11) 3031-1274',
    address: 'R. Cunha Gago, 129',
    neighborhood: 'Pinheiros',
    city: 'São Paulo',
    state: 'SP',
    zip_code: '04023-001',
    trading_hour: 'Horário: das 12h00 às 00h00',
    payment: 'Cartão Débito/Crédito e Dinheiro',
    rank: 'Rank',
    services: 'Servimos porções e lanches'
  },
  {
    name: 'Bar perdido no mundo',
    phone: '(11) 6666-7777',
    address: 'R. Cunha Gago, 129',
    neighborhood: 'Pinheiros',
    city: 'São Paulo',
    state: 'SP',
    zip_code: '04023-001',
    trading_hour: 'Horário: das 12h00 às 00h00',
    payment: 'Cartão Débito/Crédito e Dinheiro',
    rank: 'Rank',
    services: 'Servimos porções e lanches'
  }
])

beers.each { |beer| BarBeer.create(bar: bars[0], beer: beer) }
beers.each { |beer| BarBeer.create(bar: bars[1], beer: beer) }
beers.each { |beer| BarBeer.create(bar: bars[2], beer: beer) }
beers.each { |beer| BarBeer.create(bar: bars[3], beer: beer) }

User.create([
  {
    email: 'meu@email.com',
    password: '123456'
  },
  {
    email: 'without@perfil.com',
    password: '123456'
  }
])
