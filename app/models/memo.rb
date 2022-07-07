# == Schema Information
#
# Table name: memos
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_memos_on_user_id  (user_id)
#
class Memo < ApplicationRecord
end
