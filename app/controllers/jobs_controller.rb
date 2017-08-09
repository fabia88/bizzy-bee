class JobsController < ApplicationController
  def index
    if params[:category]
      @category = Category.find_by_name(params[:category])
      @jobs = @category.jobs
    else
      @jobs = Job.all
    end
  end

  def show
    @job = Job.find(params[:id])
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
  end

  def destroy
  end

  private
  def job_params
    params.require(:job).permit(:title, :description, :rate, :category_id)
  end
end
