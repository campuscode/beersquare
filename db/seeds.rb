beer = Beer.create(
  name: 'KBS 2016',
  brewery: 'Founders Brewing',
  style: 'Imperial Russial Stout',
  abv: 11.9,
  ibu: 70,
  nationality: 'American',
  description: 'Descrição da cerveja maravilhosa'
)

local = Bar.create(
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
)
