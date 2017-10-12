class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :lastest_blog_posts

  def set_locale
    I18n.locale = extract_locale_from_accept_language_header || I18n.default_locale
  end

  def lastest_blog_posts
    @lastest_posts = Post.latest
  end

  private

  def extract_locale_from_accept_language_header
    case request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
      when 'en'
        :en
      when 'ko'
        :ko
      when 'ja'
        :ja
      else
        :en
    end
  end
end
