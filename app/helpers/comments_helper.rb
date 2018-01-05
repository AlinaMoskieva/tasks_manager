module CommentsHelper
  def autor(comment)
    "Autor: #{comment.user.email}"
  end

  def created_at(comment)
    "Created at #{comment.created_at.strftime("%m.%d.%Y at %I:%M%P")}"
  end
end
