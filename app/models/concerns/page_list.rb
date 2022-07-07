module PageList

  # 重複したscopeまとめる

  PER = 7

  def display_list(page)
    page(page).per(PER)
  end
end