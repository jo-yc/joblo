class Api::Blog::ImageSortController < ActionController::API
  def index
    post = Post.find params[:post_id]
    @images = post.images
    render json: @images, status: :ok
  end

  def sort
    post = Post.find params[:post_id]
    image = post.images.find params[:id]
    image.insert_at params[:new_index]
    post.reload
    @images = post.images
    render json: @images, status: :ok
  end
end
