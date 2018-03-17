# After creating your database, seed it with some example data by writing "rake db:seed" in your command line.

#users
bobby = User.create(username: "Bobby", email: "bob@hotmail.com", password: "beamer")
debbie = User.create(username: "Debbie", email: "deb@hotmail.com", password: "radio")
martin = User.create(username: "Martin", email: "marty@hotmail.com", password: "6figures")

# topics
baseball = Topic.create(name: "Baseball", user_id: 1)
cars = Topic.create(name: "Cars", user_id: 1)
radio = Topic.create(name: "Radio", user_id: 2)
love = Topic.create(name: "Love", user_id: 2)
meditation = Topic.create(name: "Meditation", user_id: 3)
hometown = Topic.create(name: "Hometown", user_id: 3)

# articles
tigers1 = Article.create(title: "Tigers' Prospect", url: "https://www.blessyouboys.com/2018/3/17/17118950/detroit-tigers-prospect-rankings-isaac-paredes-scouting-report", topic_id: 1)
tigers2 = Article.create(title: "Tigers' News", url: "https://www.mlb.com/tigers/news", topic_id: 1)
lemons = Article.create(title: "50 Worst Cars", url: "http://time.com/4723114/50-worst-cars-of-all-time/", topic_id: 2)
hot_rods = Article.create(title: "Cool Hot Rods", url: "http://www.carophile.org/10-cars-make-great-hot-rods/", topic_id: 2)
npr = Article.create(title: "NPR Homepage", url: "https://www.npr.org/", topic_id: 3)
bbc = Article.create(title: "BBC Homepage", url: "http://bbcworldservice.radio.net/", topic_id: 3)
lost_love = Article.create(title: "Lost Love Album", url: "https://lostlove.bandcamp.com/", topic_id: 4)
new_love = Article.create(title: "New Love Quotes", url: "https://www.goodreads.com/quotes/tag/new-love", topic_id: 4)
nyt = Article.create(title: "NY Times Meditation", url: "https://www.nytimes.com/topic/subject/meditation", topic_id: 5)
wash_post = Article.create(title: "Meditation vs Depression", url: "https://www.washingtonpost.com/news/inspired-life/wp/2018/02/26/nothing-worked-for-my-depression-until-i-tried-meditation/?utm_term=.437c40322257", topic_id: 5)
local = Article.create(title: "Hometown News", url: "https://www.grossepointenews.com/", topic_id: 6)
new_owner = Article.create(title: "New Ownership of Paper", url: "https://www.detroitnews.com/story/news/local/wayne-county/2017/08/19/grosse-pointe-news-new-owner/583264001/", topic_id: 6)
