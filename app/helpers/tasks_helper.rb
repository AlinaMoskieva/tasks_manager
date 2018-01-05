module TasksHelper
  def preview_description(task)
    truncate(task.description)
  end

  def task_status(task)
    task.status ? "Completed" : "Not completed"
  end

  def project_name(task)
    return "-" unless task.project.present?
    link_to task.project.title, task.project
  end

  def select_project_collection
    current_user.projects.map { |p| [p.title, p.id] }
  end
end
