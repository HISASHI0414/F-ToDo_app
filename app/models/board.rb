# == Schema Information
#
# Table name: boards
#
#  id          :bigint           not null, primary key
#  board_title :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
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
  has_many :comments, dependent: :destroy
  has_rich_text :board_content
end
