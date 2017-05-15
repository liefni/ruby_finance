ScheduledTask.create_task(:update_quotes, Setting.order(created_at: :desc).first.quote_update_interval.to_s + 'm') do
  QuotesController.new.update
end

ScheduledTask.create_task(:generate_report, '1h') do
  StockReportsController.new.generate
end