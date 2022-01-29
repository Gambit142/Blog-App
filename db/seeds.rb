photo1 = 'https://images.unsplash.com/photo-1624574337423-7ea725c5540c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80'
photo2 = 'https://images.unsplash.com/photo-1489980557514-251d61e3eeb6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
photo3 = 'https://images.unsplash.com/photo-1524660988542-c440de9c0fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
photo4 = 'https://images.unsplash.com/photo-1487573884658-a5d3c667584e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=803&q=80'
bio_text = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed neque enim, viverra nec quam sit amet, suscipit aliquam nulla.'
user1 = User.create!(name: 'Francis Ugorji', photo: photo1, bio: "#{bio_text} - Francis Ugorji", posts_counter: 0, email: 'francis@gmail.com', password: '123456', confirmed_at: Time.now)
user4 = User.create!(name: 'Muhammad Sesay', photo: photo4, bio: "#{bio_text} - Muhammad Sesay", posts_counter: 0, email: 'muhammad@gmail.com', password: '123456')
user2 = User.create!(name: 'Brian Orora', photo: photo2, bio: "#{bio_text} - Brian Orora", posts_counter: 0, email: 'brian@gmail.com', password: '123456')
user3 = User.create!(name: 'Toluwase Ajise', photo: photo3, bio: "#{bio_text} - Toluwase Ajise", posts_counter: 0, email: 'tolu@gmail.com', password: '123456')
user4 = User.create!(name: 'Chaw Nguni', photo: photo4, bio: "#{bio_text} - Chaw Nguni", posts_counter: 0, email: 'chaw@gmail.com', password: '123456')

lorem_donec = 'Donec dapibus consequat tellus a pulvinar. Fusce auctor rhoncus orci a semper. Sed interdum accumsan ullamcorper.'
lorem_mauris = 'Mauris hendrerit odio eu quam dapibus, sit amet malesuada quam pulvinar. Ut quis venenatis ex, eu tristique orci.'

post1 = user1.posts.create!(title: 'Technology', text: lorem_donec, likes_counters: 0, comments_counter: 0)
post2 = user1.posts.create!(title: 'Science', text: lorem_mauris, likes_counters: 0, comments_counter: 0)

post3 = user2.posts.create!(title: 'Business', text: lorem_donec, likes_counters: 0, comments_counter: 0)
post4 = user2.posts.create!(title: 'Education', text: lorem_mauris, likes_counters: 0, comments_counter: 0)

post5 = user3.posts.create!(title: 'Sports', text: lorem_donec, likes_counters: 0, comments_counter: 0)
post6 = user3.posts.create!(title: 'Agriculture', text: lorem_mauris, likes_counters: 0, comments_counter: 0)

post7 = user4.posts.create!(title: 'Arts', text: lorem_donec, likes_counters: 0, comments_counter: 0)
post8 = user4.posts.create!(title: 'Infrastructure', text: lorem_mauris, likes_counters: 0, comments_counter: 0)

good_placeholder = 'Lorem Ipsum is a good placeholder'
best_placeholder = 'Lorem Ipsum is the best placeholder'

user2.comments.create!(text: good_placeholder, post: post1)
user3.comments.create!(text: best_placeholder, post: post1)

user3.comments.create!(text: good_placeholder, post: post2)
user4.comments.create!(text: best_placeholder, post: post2)

user1.comments.create!(text: good_placeholder, post: post3)
user3.comments.create!(text: best_placeholder, post: post3)

user3.comments.create!(text: good_placeholder, post: post4)
user4.comments.create!(text: best_placeholder, post: post4)

user1.comments.create!(text: good_placeholder, post: post5)
user2.comments.create!(text: best_placeholder, post: post5)

user1.comments.create!(text: good_placeholder, post: post6)
user4.comments.create!(text: best_placeholder, post: post6)

user1.comments.create!(text: good_placeholder, post: post7)
user2.comments.create!(text: best_placeholder, post: post7)

user2.comments.create!(text: good_placeholder, post: post8)
user3.comments.create!(text: best_placeholder, post: post8)

user2.likes.create!(post: post1)
user3.likes.create!(post: post1)

user3.likes.create!(post: post2)
user4.likes.create!(post: post2)

user1.likes.create!(post: post3)
user3.likes.create!(post: post3)

user3.likes.create!(post: post4)
user4.likes.create!(post: post4)

user1.likes.create!(post: post5)
user2.likes.create!(post: post5)

user1.likes.create!(post: post6)
user4.likes.create!(post: post6)

user1.likes.create!(post: post7)
user2.likes.create!(post: post7)

user2.likes.create!(post: post8)
user3.likes.create!(post: post8)
