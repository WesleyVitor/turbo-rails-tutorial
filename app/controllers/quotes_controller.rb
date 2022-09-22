class QuotesController < ApplicationController

  before_action :set_quote, only: [:show, :edit,:update,:destroy]
  
  def index
    @quotes = Quote.ordered
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(params_quote)
    if @quote.save
      respond_to do |format|
        format.html {redirect_to quotes_path, notice:"Quote was successfully created."}
        format.turbo_stream
      end
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
    respond_to do |format|
      format.html {redirect_to quotes_path, notice: "Quote was successfully destroyed."}
      format.turbo_stream

    end 
  end

  private
  def set_quote
    @quote = Quote.find(params[:id])
  end

  def params_quote
    params.require(:quote).permit(:name)
  end
end
