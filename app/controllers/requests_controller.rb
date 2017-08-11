class RequestsController < ApplicationController
  before_action :set_request, only: [:confirm, :deny, :cancel]


  def index
    @received_requests = current_user.received_requests.sort_by { |received_request| received_request.created_at }
    @sent_requests = current_user.requests.sort_by { |sent_request| sent_request.created_at }
  end

  def new
    @job = Job.find(params[:job_id])
    @request = Request.new
  end

  def create
    @job = Job.find(params[:job_id])
    @request = Request.new(request_params)
    @request.status = "Pending"
    @request.total_price = @job.rate * @request.duration
    @request.job = @job
    @request.user = current_user
    if @request.save
      redirect_to requests_path
    else
      render :new
    end
  end

  def confirm
    @request.status = "Confirmed"
    @request.save
    redirect_to requests_path
  end

  def deny
    @request.status = "Denied"
    @request.save
    redirect_to requests_path
  end

  def cancel
    @request.status = "Cancelled"
    @request.save
    redirect_to requests_path
  end

  private
  def set_request
    @request = Request.find(params[:id])
  end
  def request_params
    params.require(:request).permit(:date, :duration)
  end
end


