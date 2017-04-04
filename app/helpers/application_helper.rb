module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, :class=>"btn btn-default", :style => "column-width: 100px;", :role => "group"
  end

  def category_sort(category, title = nil)
    title = category.titleize
    link_to title, {:where => title}, :class => "btn btn-default btn-group-vertical", :style => "column-width: 350px;", :role => "group"
  end

end
