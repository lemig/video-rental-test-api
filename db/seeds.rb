# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

users = User.create([{ email: "miguel@example.com" }, { email: "cris@example.com" }] )

user = users.first
user.auth_token = 'DEV_TOKEN'
user.save

movies = Movie.create([
  { title: "300: Rise of an Empire",
    plot: "Greek general Themistokles leads the charge against invading Persian forces led by mortal-turned-god Xerxes and Artemisia, vengeful commander of the Persian navy."
  },
  { title: "Into the Wild",
    plot: "After graduating from Emory University, top student and athlete Christopher McCandless abandons his possessions, gives his entire $24,000 savings account to charity and hitchhikes to Alaska to live in the wilderness. Along the way, Christopher encounters a series of characters that shape his life."
  }
])

seasons = Season.create([
  { title: "Shameless",
    plot: "An alcoholic man lives in a perpetual stupor while his six children with whom he lives cope as best they can."
  },
  { title: "Breaking Bad",
    plot: "A chemistry teacher diagnosed with a terminal lung cancer, teams up with his former student, Jesse Pinkman, to cook and sell crystal meth."
  }
])

seasons.first.episodes.create([
  { title: "Pilot",
    plot: "Having her handbag stolen proves to be a blessing for Fiona when a handsome stranger named Steve comes to her rescue. ",
    number: 1
  },
  { title: "Frank the Plank",
    plot: "Drunk as a skunk, Frank has a run-in with Karen's father and returns home to take it out on Ian.",
    number: 2
  },
  { title: "Aunt Ginger",
    plot: "Having blown off Steve, Fiona turns her attention to Tony, the cop who's had a crush on her since childhood. Steve, however, has not given up the fight.",
    number: 3
  }
])

seasons.last.episodes.create([
  { title: "Pilot",
    plot: "A high school chemistry teacher is diagnosed with terminal lung cancer and resorts to selling methamphetamine to provide for his family when he is dead.",
    number: 1
  },
  { title: "Cat's in the Bag...",
    plot: "Walt and Jesse try to decide what to do with the body of Emilio and their prisoner, Krazy 8.",
    number: 2
  },
  { title: "...And the Bag's in the River",
    plot: "Walt is struggling to decide if it's best to kill Krazy 8 or let him go.",
    number: 3
  }
])

Content.all.each do |content|
  content.purchase_options.create([{ quality: "SD", price: 1.99 }, { quality: "HD", price: 2.99 }])
end
