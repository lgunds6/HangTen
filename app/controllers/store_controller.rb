class StoreController < ApplicationController
    def index
        @boards = Board.all
    end
    def show
        @boards = Board.find_by(id: params[:id])
    end
    def new
        @boards = Board.new
        end
    end
    def create
        @boards = Board.new(boards_params)
        if @boards.save
            redirect_to @boards
        else
            render :new
    end



    private
    def boards_params
        params.require(:boards).permit(:title, :condition, :description, :price)
    end
    def find_board
    @boards = Board.find(params[:id])
    end
end

