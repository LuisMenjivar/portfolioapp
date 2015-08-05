module ApplicationHelper
  def days_left_to_complete(todo)
    seconds = 7.days - (Time.now - todo.created_at)
    days = (seconds/86400).to_i  
    remaining_seconds = seconds%86400
    hours = (remaining_seconds/3600).to_i 
    return "You have #{days} days and #{hours} hours to complete this task"
  end
  def percentage_to_complete(todo)
    seconds = 7.days - (Time.now - todo.created_at)
    percentage = ((seconds / 7.days) * 100).to_i
    return "#{percentage}%"
  end
end

