module ApplicationHelper
  def sort_by_last_update(list)
    list.order("updated_at DESC")
  end

  def formatted_date(date)
    date&.strftime('%d.%m.%Y')
  end
end
