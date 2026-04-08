require "minitest/autorun"
require_relative "../user"
require_relative "../resource"
require_relative "../booking"

class BookingTest < Minitest::Test
  def setup
    @user = User.new(id: 1, name: "mahlet", role: "student")
    @resource = Resource.new(id: 1, name: "Microscope", category: "lab")
  end

  def test_booking_available_resource
    booking = Booking.new(user: @user, resource: @resource)
    assert_equal "active", booking.status
    assert_equal false, @resource.available?
  end

  def test_booking_unavailable_resource
    Booking.new(user: @user, resource: @resource)

    assert_raises(BookingError) do
      Booking.new(user: @user, resource: @resource)
    end
  end

  def test_cancel_booking
    booking = Booking.new(user: @user, resource: @resource)
    booking.cancel

    assert_equal "cancelled", booking.status
  end

  def test_resource_available_after_cancel
    booking = Booking.new(user: @user, resource: @resource)
    booking.cancel

    assert_equal true, @resource.available?
  end
end