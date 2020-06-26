module ApplicationHelper
  def sort_by_last_update(list)
    list.order("updated_at DESC")
  end
end
