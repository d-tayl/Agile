module ApplicationHelper
  
  # Define structure of page titles
  def title
    base_title = "Cheam Croquet Club"
  if @title.nil?
    base_title
  else
    "#{base_title} | #{@title}"
  end
end
  
end
