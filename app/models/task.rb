# == Schema Information
#
# Table name: tasks
#
#  id            :bigint           not null, primary key
#  task_content  :text
#  task_deadline :date
#  task_title    :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  board_id      :bigint           not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_tasks_on_board_id  (board_id)
#  index_tasks_on_user_id   (user_id)
#
class Task < ApplicationRecord
  belongs_to :user
  belongs_to :board
  validates :task_title, presence: true
  validates :task_content, presence: true
  validates :task_deadline, presence: true
  has_one_attached :eyecatch, dependent: :destroy

  def display_created_at
    I18n.l(self.created_at, format: :default)
  end
end
