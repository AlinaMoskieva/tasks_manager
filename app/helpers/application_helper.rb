module ApplicationHelper
  def administrator?
    current_user && current_user.admin?
  end
end
