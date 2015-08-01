class JobsController < ApplicationController
  before_action :find_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    if params[:user_id] 
      if user_signed_in? 
        @jobs = current_user.jobs.order_from_latest
      else
        authenticate_user!
      end
    else
      @jobs = Job.all.order_from_latest
    end
  end

  def new
    @job = Job.new 
  end

  def create
    @job = Job.new(job_params) 
    @job.user = current_user

    if @job.save
      flash[:notice] = "New Job Information has been created successfully!"
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @job.save
      flash[:notice] = "Job Information has been updated successfully!"
      redirect_to @job
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path    
  end

  private
  def job_params
    params.require(:job).permit(:title, :description, :location, :job_type , :occupation, :company_name, :url, :apply_information)
  end

  def find_job
    @job = Job.find(params[:id]) 
  end
end
