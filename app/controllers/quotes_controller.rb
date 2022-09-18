class QuotesController < ApplicationController

  before_action :set_quote, only: [:show, :edit,:update,:destroy]
  
  def index
    @quotes = Quote.all
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(params_quote)
    if @quote.save
      redirect_to quotes_path, notice:"Quote was successfully created."
    else
      render :new, status: :unprocessable_entity

    end
  end

  def edit
  end

  def update
    if @quote.update(params_quote)
      redirect_to quotes_path, notice:"Quote was successfully updated."
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @quote.destroy
    redirect_to quotes_path, notice: "Quote was successfully destroyed."
  end

  private
  def set_quote
    @quote = Quote.find(params[:id])
  end

  def params_quote
    params.require(:quote).permit(:name)
  end
end
