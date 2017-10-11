class Api::Blog::PostsController < ActionController::API
  def index
    page_num = params[:page].present? ? params[:page] : 1
    @posts = Post.category_on(params[:category]).page(page_num).per(5)
    prev_page = @posts.prev_page.nil? ? 0 : @posts.prev_page
    next_page = @posts.next_page.nil? ? 0 : @posts.next_page
    pages_info = {
      current_page: @posts.current_page,
      total_pages: @posts.total_pages,
      next_page: next_page,
      prev_page: prev_page
    }
    render json: @posts, adapter: :json, meta: {pages_info: pages_info}, status: :ok
  end

  def show
    @post = Post.find params[:id]
    render json: @post, status: :ok
  end
end
