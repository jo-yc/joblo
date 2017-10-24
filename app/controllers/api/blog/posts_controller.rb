class Api::Blog::PostsController < ActionController::API
  def index
    @q = Post.category_on(params[:category]).ransack(params[:q])
    @posts = @q.result.page(params[:page]).per(5)
    render json: @posts, adapter: :json, meta: { pages_info: pages_info }, status: :ok
  end

  def show
    @post = Post.find params[:id]
    render json: @post, status: :ok
  end

  def tags_index
    @posts = Post.on_posting.tagged_with(params[:tag_name]).page(params[:page]).per(5)
    render json: @posts, adapter: :json, meta: { pages_info: pages_info }, status: :ok
  end

  private

  def pages_info
    prev_page = @posts.prev_page.nil? ? 0 : @posts.prev_page
    next_page = @posts.next_page.nil? ? 0 : @posts.next_page
    { current_page: @posts.current_page,
      total_pages: @posts.total_pages,
      next_page: next_page,
      prev_page: prev_page }
  end
end
