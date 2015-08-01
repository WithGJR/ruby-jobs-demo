class Job < ActiveRecord::Base
  enum job_type: ["Full-Time", "Part-Time", "Contract", "Internship", "Other Job Type"]
  enum occupation: ["Web Backend", "Web Frontend", "Web Design", "Q/A Testing", "Other Occupation"]
  validates :title, 
            :description, 
            :location, 
            :company_name, 
            :apply_information,
            presence: :true

  belongs_to :user

  scope :order_from_latest, -> { order(created_at: :desc) }

  def to_param
    "#{id}-#{title.gsub(" ", "-")}" 
  end
end
