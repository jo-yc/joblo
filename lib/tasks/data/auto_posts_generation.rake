namespace :data do
  desc "Generate Posts"
  task :auto_posts_generation, [:post_size] => :environment do |_t, args|
    ActiveRecord::Base.transaction do
      size = args.post_size.to_i
      size.times do
        title = Faker::Lorem.sentence
        body = Faker::Lorem.paragraph(40)
        category = Post.categories_i18n.keys.sample
        file = nil; image = nil; images = []
        6.times do |tt|
          file = File.new Rails.root.join("app/assets/images/post-#{tt+1}.jpg")
          image = PostImage.create image: file
          images << image
        end
        Post.create(title: title, body: body, category: category, images: images, main_image: images.first).posting!
      end
    end
  end

  desc "Destroy posts"
  task :auto_posts_destroy do
    ActiveRecord::Base.transaction do
      Post.destroy_all
    end
  end
end
