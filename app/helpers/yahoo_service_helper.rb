module YahooServiceHelper

  @@stocks = ['NZDUSD=X', 'NZDAUD=X', 'NZDEUR=X', 'NZDGBP=X', 'NZDJPY=X']

  def self.get_stock_quotes
    url = "https://query.yahooapis.com/v1/public/yql?q=select * from yahoo.finance.quotes where symbol in ('#{@@stocks.join("','")}')&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback="
    url.gsub!(' ', '%20').gsub!("'", '%22')

    begin
      result = HTTParty.get(url, :verify => false).parsed_response['query']['results']['quote']
    rescue Exception => e
      Error.new(message: e.message).save
      return
    end

    quotes = []
    result.each do |q|
      quotes.append Quote.new(:ask => q['Ask'], :bid => q['Bid'], :name => q['Name'], :symbol => q['Symbol'])
    end
    return quotes
  end

  def self.update_stock_quotes_now
    quotes = get_stock_quotes
    quotes.each {|q| q.save} if quotes
  end
end
