class HomeController < ApplicationController
  def index
  end

  def new
    @board = current_user.boards.build
  end

  def show
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to home_path(@board)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def board_params
    params.require(:board).permit(:title, :description)
  end
end