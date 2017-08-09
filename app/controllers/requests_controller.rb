class RequestsController < ApplicationController
  def index
    @requests = Request.all
  end
  # requests
  # GET
  # /requests(.:format)
  # requests#index

  def new
    @job = Job.find(params[:job_id])
    @request = Request.new
  end
  # new_job_request
  # GET
  # /jobs/:job_id/requests/new(.:format)
  # requests#new

  def create
    @job = Job.find(params[:job_id])
    @request = Request.new(request_params)
    @request.status = "Pending"
    # :status
    @request.total_price = @job.rate * @request.duration
    # :total_price
    @request.job = @job
    # :job_id
    @request.user = current_user
    # :user_id
    if @request.save
      redirect_to requests_path
    else
      render :new
    end
  end
  # job_requests
  # POST
  # /jobs/:job_id/requests(.:format)
  # requests#create

  def confirm
  end

  def deny
  end

  def cancel
  end

  private
  def request_params
    params.require(:request).permit(:date, :duration)
  end
end
