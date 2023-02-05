class ClocksIndexSerializer < ActiveModelSerializers::Model
  attributes :status, :message, :total, :page, :per_page, :clocks

  def clocks
    @clocks.map { ClockSerializer.new(_1) }
  end
end
