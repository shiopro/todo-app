class HomeController < ApplicationController
  def index

  end

  def new
    @board = Board.new
  end

  def create
  end
end