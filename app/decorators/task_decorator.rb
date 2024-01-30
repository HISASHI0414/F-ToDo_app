# frozen_string_literal: true

module TaskDecorator
  def display_created_at
    I18n.l(self.created_at, format: :default)
  end
end
