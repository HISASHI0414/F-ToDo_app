# == Schema Information
#
# Table name: profiles
#
#  id         :bigint           not null, primary key
#  nickname   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
class Profile < ApplicationRecord
  belongs_to :user #userモデル（user.rb）のことを指す。記事ごとに該当するUserは一人のため単数系で表記
  has_one_attached :avatar
end
