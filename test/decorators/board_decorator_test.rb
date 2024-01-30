# frozen_string_literal: true

require 'test_helper'

class BoardDecoratorTest < ActiveSupport::TestCase
  def setup
    @board = Board.new.extend BoardDecorator
  end

  # test "the truth" do
  #   assert true
  # end
end
