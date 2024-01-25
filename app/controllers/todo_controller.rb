class TodoController < ApplicationController
  def index
    @boards = Board.all
  end
end
