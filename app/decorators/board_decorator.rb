# frozen_string_literal: true

module BoardDecorator
  def author_name
    user.display_name #article.rbはuser.rbと紐づいている（belongs_to :user）ため、user.rb内のメソッド（display_name）が使える
  end

  def display_created_at
    I18n.l(self.created_at, format: :default)
  end
end
