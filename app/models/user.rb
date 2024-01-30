# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :boards, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships, source: :following

  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :follower

  def prepare_profile
    profile || build_profile
  end

  def has_writtern_board?(board)
    boards.exists?(id: board.id)
  end

  def has_writtern_task?(task)
    tasks.exists?(id: task.id)
  end

  def follow!(account)
    account_id = get_user_id(account)
    following_relationships.create!(following_id: account_id)
  end

  def unfollow!(account)
    account_id = get_user_id(account)
    relation = following_relationships.find_by!(following_id: account_id)
    relation.destroy!
  end
  # current_user.has_followed?(@account)
  def has_followed?(account)
    following_relationships.exists?(following_id: account.id)
  end

  private
  def get_user_id(account)
    if account.is_a?(User)
      account_id = account.id
    else
      account_id = account
    end
  end
end
