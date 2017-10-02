class Admin::BaseController < ApplicationController
  before_action :authenticate_administrator!
  before_action :is_admin

  def is_admin
    @admin = admin?
  end

  private

  def admin?
    true
  end
end
