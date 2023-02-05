class ClockShowSerializer < ActiveModelSerializers::Model
  attributes :status, :message, :clock

  def clock
    ClockSerializer.new(@clock)
  end
end
