require 'rails_helper'

RSpec.describe Job, type: :model do
  let!(:job) do
    Job.new( title: "hello", 
             description: "yes", 
             location: "taipei",
             company_name: "google",
             apply_information: "Please email to test@mail.com",
             url: "http://google.com"
           ) 
  end

  it "Title should not be empty" do 
    job.title = ""
    job.save
    expect(job.errors.count).to eq(1)
  end

  it "Description should not be empty" do 
    job.description = ""
    job.save
    expect(job.errors.count).to eq(1)
  end

  it "Location should not be empty" do 
    job.location = ""
    job.save
    expect(job.errors.count).to eq(1)
  end

  it "Company Name should not be empty" do 
    job.company_name = ""
    job.save
    expect(job.errors.count).to eq(1)
  end

  it "Apply Information should not be empty" do 
    job.apply_information = ""
    job.save
    expect(job.errors.count).to eq(1)
  end
end
