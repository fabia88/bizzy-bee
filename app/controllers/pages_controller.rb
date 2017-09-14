class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @categories = Category.all
    @user = User.new
    @jobs = Job.all
  end
end
