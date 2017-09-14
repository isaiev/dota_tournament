module ApplicationHelper

  ACTIVE_CLASS = 'active'.freeze

  def navigation_class_by_path(path)
    current_page?(path) ? ACTIVE_CLASS : ''
  end

  def navigation_class_by_controller(name)
    controller_name == name ? ACTIVE_CLASS : ''
  end

end
