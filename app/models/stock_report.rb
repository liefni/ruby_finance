class StockReport < ApplicationRecord

  def self.build_report(report_type)
    report = StockReport.new
    data = get_report_data

    report.report = report_type.new.create do
      heading 'Stock Report'
      data.each_key do |key|
        quotes = data[key]
        sub_heading key
        table do
          table_heading do
            table_cells 'Date & Time (UTC)', 'Ask', 'Bid'
          end
          quotes.each do |quote|
            table_row do
              table_cells quote.created_at.strftime('%d/%m/%Y %H:%M'), quote.ask, quote.bid
            end
          end
        end
      end
    end

    report.save
  end

  def self.get_report_data
    Quote.where("created_at > ?", Time.now.utc - 1.hour).group_by{|r| r.name}
  end
end
