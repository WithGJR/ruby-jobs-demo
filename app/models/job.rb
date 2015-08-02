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

  scope :recent, -> { order(created_at: :desc) }

  def self.search(keyword)
    searchable_columns = %w( title description location company_name apply_information )
    lowercase_keyword_used_inside_query = "%#{keyword.downcase}%"
    
    where(
      [
        searchable_columns.map { |column| "LOWER(#{column}) LIKE ?" }.join(" OR ") 
      ].concat(
        searchable_columns.map { lowercase_keyword_used_inside_query }
      )
    )
  end

  def to_param
    "#{id}-#{title.gsub(" ", "-")}" 
  end
end
