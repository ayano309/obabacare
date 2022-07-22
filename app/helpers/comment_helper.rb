module CommentHelper
  def comment_exists?(comments)
    'card_comment_detail' if comments.exists?
  end
  
  def important_comment?(comment)
    'important_comment' if comment.is_important == true
  end
end
