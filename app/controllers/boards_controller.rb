class BoardsController < ApplicationController
    
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
        @board = Board.new(boards_params)
        if @board.save
            redirect_to @board
        else
            render :new
        end
    end


    private
    def boards_params
        params.require(:board).permit(:title, :condition, :description, :price)
    end
    def find_board
    @board = Board.find(params[:id])
    end
end

