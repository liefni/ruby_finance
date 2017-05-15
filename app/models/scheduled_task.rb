class ScheduledTask
  require 'rufus-scheduler'

  @@tasks = {}

  def self.tasks
    @@tasks
  end

  def self.create_task(symbol, interval, &block)
    @@tasks[symbol] = ScheduledTask.new(interval, &block)
  end

  def initialize(interval, &block)
    @scheduler = Rufus::Scheduler.new
    @interval = interval
    @block = block
    schedule_task
  end

  def interval
    @interval
  end
  def interval=(value)
    @interval = value
    stop
    start
  end

  def scheduled?
    @job.scheduled?
  end

  def stop
    @job.unschedule if @job.scheduled?
  end

  def start
    schedule_task unless @job.scheduled?
  end



  def run
    @block.call(1)
  end

  private
  def schedule_task
    job_id = @scheduler.every @interval do
      run
    end

    @job = @scheduler.job(job_id)
  end

end