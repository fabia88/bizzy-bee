class PagesController < ApplicationController
  def home
    @categories = Category.all
    @user = User.new
  end
end
