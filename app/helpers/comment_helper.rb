module CommentHelper
  #コメントは存在するか
  def comment_exists?(comments)
    'card_comment_detail' if comments.exists?
  end
  
  #重要なコメントか
  def important_comment?(comment)
    'important_comment' if comment.is_important == true
  end
  
  #便秘気味か
  def defecations_exists?(defecations)
    if defecations.count < 2
      return true
    end
  end
end
