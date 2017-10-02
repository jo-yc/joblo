class Blog::Posts::FamilyController < Blog::BaseController
  def index
    @posts = Post.category_on :family
  end

  def show
  end
end
