module EmotionHelper
  def add_color_class(emotion)
    if emotion == 'happy'
      return 'bg-pink'
    elsif emotion == 'anger'
      return 'bg-red'
    elsif emotion == 'sad'
      return 'bg-blue'
    elsif emotion == 'fun'
      return 'bg-orange'
    elsif emotion == 'expressionless'
      return 'bg-gray'
    end
  end
end
