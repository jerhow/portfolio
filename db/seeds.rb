# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |topic|
  Topic.create!(title: "Topic #{topic}")
end

puts "3 topics created"

10.times do |num|
  Blog.create!(
    title: "My Blog Post #{num}",
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris venenatis augue dignissim metus porttitor, nec dignissim nisl lacinia. Integer id sapien vel risus ullamcorper gravida malesuada ut est. Pellentesque suscipit lectus ligula, facilisis sollicitudin risus pretium ut. Nullam rhoncus magna varius ligula suscipit lacinia. Etiam vestibulum magna sit amet bibendum convallis. Morbi gravida, eros ut commodo scelerisque, nunc dui varius risus, in sagittis urna dui id dolor. Curabitur eu dolor et lacus rutrum bibendum eu in risus. Suspendisse nec pellentesque mi. Vivamus semper felis non lobortis porttitor. Phasellus eleifend eleifend mi. Proin nec condimentum odio. Etiam pulvinar orci leo, pretium eleifend velit cursus eu. In et tellus ut nibh egestas ornare. Nulla quis molestie nibh.",
    topic_id: Topic.last.id
  )
end

puts "10 blog posts created"

5.times do |num|
  Skill.create!(
    title: "Rails #{num}",
    percent_utilized: 15
  )
end

puts "5 skills created"

8.times do |num|
  PortfolioItem.create!(
    title: "Portfolio item #{num}",
    subtitle: "Ruby on Rails",
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mattis vehicula congue. Mauris et quam tempus, dignissim odio nec, scelerisque risus. Aenean vitae imperdiet dui, nec hendrerit justo. Phasellus ac.",
    main_image: "https://via.placeholder.com/600x400",
    thumb_image: "https://via.placeholder.com/350x200"
  )
end

1.times do |num|
  PortfolioItem.create!(
    title: "Portfolio item #{num}",
    subtitle: "AngularJS",
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mattis vehicula congue. Mauris et quam tempus, dignissim odio nec, scelerisque risus. Aenean vitae imperdiet dui, nec hendrerit justo. Phasellus ac.",
    main_image: "https://via.placeholder.com/600x400",
    thumb_image: "https://via.placeholder.com/350x200"
  )
end

# https://placehold.it/350x200
# https://via.placeholder.com/350x200

puts "9 portfolio items created"

3.times do |technology|
  PortfolioItem.last.technologies.create!(
    name: "Technology #{technology}"
  )
end

puts "3 technologies created"
