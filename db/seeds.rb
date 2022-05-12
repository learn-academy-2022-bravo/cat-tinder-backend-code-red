vamps = [
    {
      name: "Edward Cullen",
      age: 108,
      enjoys: "Stalking Bella and going for a stroll",
      image: "https://i.insider.com/61952ab1a2e68800198aa8b1?width=600&format=jpeg&auto=webp"
    },
    {
      name: "Count von Count",
      age: 1832652,
      enjoys: "Counting, counting, and counting",
      image: "https://i.scdn.co/image/ab6761610000e5eb3c440e8ded13dd10533a22fa"
    },
    {
      name: "Angel",
      age: 26,
      enjoys: "Moonlit walks and fighting",
      image: "https://i.pinimg.com/originals/16/6c/62/166c627698b885dbe9b010cc8ad116de.jpg"
    }
  ]

  vamps.each do |each_vamp|
    Vampire.create each_vamp
    puts "creating vamp #{each_vamp}"
  end