class StockReportsController < ApplicationController
  def generate
    StockReport.build_report(TextReport)
    redirect_to({:action => "index"})
  end

  def index
    @reports = StockReport.order(created_at: :desc)
  end

  def download
    id = params[:id]
    report = StockReport.find(id)
    send_data report.report, :filename => report.created_at.to_s + '_report.txt', :type => 'text/plain'
  end
end
