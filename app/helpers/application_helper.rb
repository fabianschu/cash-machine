module ApplicationHelper
  def sort_by_last_update(arr)
    puts arr
    result = arr.order("updated_at DESC")
    result
  end
end
