class StoreController < ApplicationController
    def index
        @boards = Board.all
    end
    def show
        @boards = Board.find(params[:id])
    end
    def new
    end
    def create
    end
    

end
