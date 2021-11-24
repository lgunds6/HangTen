class BoardsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :find_board, only: %i[show edit update destroy]
  def index
    @boards = Board.all
  end

  def show
    @board = Board.find_by(id: params[:id])
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      mode: 'payment',
      # customer_email: current_user.email,
      line_items: [{
        price_data: {
          product_data: {
            name: @board.title,
            description: @board.description
            #   images: ["https://unsplash.com/photos/LCDYCLEJlEo"]
          },
          currency: 'aud',
          unit_amount: @board.price_in_cents
          # tax_behavior: 'inclusive'
        },
        quantity: 1
      }],
      payment_intent_data: {
        metadata: {
          dish_id: @board.id,
          user_id: current_user.id
        }
      },
      success_url: URI.join(root_url, payments_success_path),
      cancel_url: URI.join(root_url, payments_cancel_path)
    )
    @session_id = session.id
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

  def edit; end

  def update
    if @board.update(boards_params)
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
    params.require(:board).permit(:title, :condition, :description, :price, :picture)
  end

  def find_board
    @board = Board.find(params[:id])
  end
end
