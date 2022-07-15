module EmotionHelper
  def add_color_class(emotion)
    if emotion == "happy"
      return 'pink'
    elsif emotion == "anger"
      return 'red'
    elsif emotion == "sad"
      return 'blue'
    elsif emotion == "fun"
      return 'orange'
    elsif emotion == "expressionless"
      return 'gray'
    end
  end
end
