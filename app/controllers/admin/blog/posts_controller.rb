class Admin::Blog::PostsController < Admin::BaseController
  before_action :setup_post, except: [:index, :new, :create]

  def index
    @posts = Post.order(id: :desc)
  end

  def show; end

  def new
    @post = Post.new
    @post.images_build
  end

  def create
    @post = Post.new post_params
    if @post.save
      redirect_to admin_blog_posts_path, notice: I18n.t('views.common.created', model: Post.model_name.human)
    else
      render :new, alert: I18n.t('views.common.crud_error')
      @post.images_build
    end
  end

  def edit
    # @post.images_build
  end

  def update
    ActiveRecord::Base.transaction do
      @post.update!(post_params) if post_params.present?
      @post.update!(update_params) if params[:update_post].present?
      @post.remove_images(params[:remove_img_id]) if params[:remove_img_id]
    end
    redirect_to admin_blog_posts_path, notice: I18n.t('views.common.updated', model: Post.model_name.human)
  rescue => e
    redirect_to edit_admin_blog_post_path(@post), alert: e.to_s
  end

  def destroy
    @post.destroy
    redirect_to admin_blog_posts_path, notice: I18n.t('views.common.deleted', model: Post.model_name.human)
  end

  def posting
    return render :show, alert: I18n.t('views.posts.main_image_required') if params[:main_image_id].blank?
    main_image = @post.images.find(params[:main_image_id])
    @post.main_image = main_image
    @post.posting! if @post.may_posting?
    redirect_to admin_blog_posts_path, notice: I18n.t('views.posts.posted')
  end

  def undo
    @post.undo! if @post.may_undo?
    redirect_to admin_blog_posts_path, notice: I18n.t('views.posts.cancel')
  end

  private

  def setup_post
    @post = Post.find params[:id]
  end

  def update_params
    params.require(:update_post).permit(
      images_attributes: [:id, :image]
    )
  end

  def post_params
    params.require(:post).permit(
      :title,
      :body,
      :category,
      images_attributes: [:id, :image, :_destroy]
    )
  end
end
