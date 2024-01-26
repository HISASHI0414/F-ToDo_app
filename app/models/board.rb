# == Schema Information
#
# Table name: boards
#
#  id            :bigint           not null, primary key
#  board_content :text             not null
#  board_title   :text             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_boards_on_user_id  (user_id)
#
class Board < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :board_title, presence: true
  validates :board_content, presence: true

  def author_name
    user.display_name #article.rbはuser.rbと紐づいている（belongs_to :user）ため、user.rb内のメソッド（display_name）が使える
  end

  def display_created_at
    I18n.l(self.created_at, format: :default)
  end
end
