class QuotesController < ApplicationController
  def index
    @stock_quotes = {}
    stocks = Quote.select(:name).distinct.order(:name)
    stocks.each do |s|
      @stock_quotes[s.name] = Quote.where(name: s.name).limit(5).order(created_at: :desc);
    end
  end

  def update
    YahooServiceHelper.update_stock_quotes_now
    redirect_to({:action => "index"})
  end
end
