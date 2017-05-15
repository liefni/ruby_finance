class SettingsController < ApplicationController
  def edit
    @setting = Setting.order(created_at: :desc).first
  end

  def update
    @setting = Setting.order(created_at: :desc).first
    if @setting.update(update_params)
      redirect_to controller: 'quotes', action: 'index'
    else
      render 'edit'
    end

    ScheduledTask.tasks[:update_quotes].interval = @setting.quote_update_interval.to_s + 'm'
  end

  private
  def update_params
    params.require(:setting).permit(:quote_update_interval)
  end
end
