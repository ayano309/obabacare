# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  vital_id   :integer          not null
#
# Indexes
#
#  index_comments_on_vital_id  (vital_id)
#
class Comment < ApplicationRecord
end
