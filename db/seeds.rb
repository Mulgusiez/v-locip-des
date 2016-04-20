augustin = User.new(email: 'mulliez.augustin@gmail.com', password: 'vélocipède')

10.times do
  mon_vélo = augustin.annonces.build(
    title:             "Mon Beau Vélo",
    street_number:    1,
    route:            "Rue esquermoise",
    locality:         "Lille",
    administrative_area_level_1: "Nord-pas-de-calais",
    postal_code:      "59000",
    country:          "France",
    price:  100,
    description: "Je vends mon beau vélocipède, je pars en vie, je n'en ai plus besoin."
    )
  mon_vélo.save!
end
