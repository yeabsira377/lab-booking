require_relative "errors"

class Resource
  attr_reader :id, :name, :category

  def initialize(id:, name:, category:)
    @id = id
    @name = name
    @category = category
    @current_booking = nil
  end

  def available?
    @current_booking.nil?
  end

  def assign_booking(booking)
    raise BookingError, "Resource already booked" unless available?
    @current_booking = booking
  end

  def clear_booking
    @current_booking = nil
  end
end