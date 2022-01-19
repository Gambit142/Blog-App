# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create!(name: 'Francis Ugorji', photo: 'bio', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed neque enim, viverra nec quam sit amet, suscipit aliquam nulla. - Francis Ugorji', posts_counter: 0)
user2 = User.create!(name: 'Brian Orora', photo: 'bio', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed neque enim, viverra nec quam sit amet, suscipit aliquam nulla. - Brian Orora', posts_counter: 0)
user3 = User.create!(name: 'Toluwase Ajise', photo: 'bio', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed neque enim, viverra nec quam sit amet, suscipit aliquam nulla. - Toluwase Ajise', posts_counter: 0)
user4 = User.create!(name: 'Chaw Nguni', photo: 'bio', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed neque enim, viverra nec quam sit amet, suscipit aliquam nulla. - Chaw Nguni', posts_counter: 0)

lorem_donec = 'Donec dapibus consequat tellus a pulvinar. Fusce auctor rhoncus orci a semper. Sed interdum accumsan ullamcorper.'
lorem_mauris = 'Mauris hendrerit odio eu quam dapibus, sit amet malesuada quam pulvinar. Ut quis venenatis ex, eu tristique orci.'

post1 = user1.posts.create!(title: 'Technology', text: lorem_donec, likes_counter: 0, comments_counter: 0)
post2 = user1.posts.create!(title: 'Science', text: lorem_mauris, likes_counter: 0, comments_counter: 0)

post3 = user2.posts.create!(title: 'Business', text: lorem_donec, likes_counter: 0, comments_counter: 0)
post4 = user2.posts.create!(title: 'Education', text: lorem_mauris, likes_counter: 0, comments_counter: 0)

post5 = user3.posts.create!(title: 'Sports', text: lorem_donec, likes_counter: 0, comments_counter: 0)
post6 = user3.posts.create!(title: 'Agriculture', text: lorem_mauris, likes_counter: 0, comments_counter: 0)

post7 = user4.posts.create!(title: 'Arts', text: lorem_donec, likes_counter: 0, comments_counter: 0)
post8 = user4.posts.create!(title: 'Infrastructure', text: lorem_mauris, likes_counter: 0, comments_counter: 0)

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
