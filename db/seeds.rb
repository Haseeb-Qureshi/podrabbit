phil = User.create!(first_name: 'Phil', last_name: 'Donahue', email: 'phil@donahue.com', password: 'abcdef')

producer_dude = User.create!(first_name: 'Producer', last_name: 'Dude', email: 'producer_dude1995@yahoo.com', password: 'hahaha')

podcast = Podcast.create!(name: "Phil's Show", client: phil)

episode = podcast.episodes.create!(status: 'In Progress', name: 'How to Get Started in Podcasting', producer: producer_dude)

episode.file_uploads.create!(url: 'abcde.hello.world', name: 'audio.mp3')
