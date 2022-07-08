module CommentHelper
  def comment_exists?(comments)
    'card_comment_detail' if comments.exists?
  end
end
