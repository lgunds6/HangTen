class BoardsController < ApplicationController
    before_action :authenticate_user!, except: %i[index show]
    before_action :find_board, only: %i[show edit update destroy]
    def index
        @boards = Board.all
    end
    def show
        @board = Board.find_by(id: params[:id])

    end
    def new
        @board = Board.new
    
    end
    def create
        @board = current_user.boards.new(boards_params)
        if @board.save
            redirect_to @board
        else
            render :new
        end
    end
    def edit
    end
    def update
        if  @board.update(boards_params)
            redirect_to @board
        else
            render :edit
        end
    end
    def destroy
        @board.destroy
        redirect_to root_path
    end

    private
    def boards_params
        params.require(:board).permit(:title, :condition, :description, :price)
    end
    def find_board
        @board = Board.find(params[:id])
    end
end

