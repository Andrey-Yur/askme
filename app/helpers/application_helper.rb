module ApplicationHelper
  def multi(count, one, many)
    count == 1 ? one : many
  end
end
