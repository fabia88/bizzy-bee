class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [ :index, :show]
  def index
    if params[:category]
      @category = Category.find_by_name(params[:category])
      @jobs = @category.jobs
    else
      @jobs = Job.all
    end

    if params[:query].present?
      @jobs = @jobs.select{|job| job.title.downcase.include?(params[:query].downcase)}
    end
  end

  def show
    @area = @job.user.area == nil ? 2 : @job.user.area
    @user_coord = { lat: @job.user.latitude, lng: @job.user.longitude }
    @request = Request.new
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to job_path(@job)
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path
  end

  private
  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :description, :rate, :category_id)
  end
end
