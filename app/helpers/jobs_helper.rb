module JobsHelper
  def format_date(date)
    date.strftime("%Y-%m-%d")   
  end

  def reformat_enum_key(enum_key)
    words = enum_key.split(" ")
    if words[0] == "Other"
      words[0]
    else
      words.join(" ") 
    end
  end

  def parse_markdown(text)
    renderer = Redcarpet::Render::HTML.new(autolink: true, hard_wrap: true)
    markdown = Redcarpet::Markdown.new(renderer)
    markdown.render(text).html_safe
  end

  def job_is_belongs_to_current_user?(job)
    job.user == current_user 
  end
end
