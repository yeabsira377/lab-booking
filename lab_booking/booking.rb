require_relative "errors"

class Booking
  attr_reader :user, :resource, :status, :created_at

  def initialize(user:, resource:)
    raise BookingError, "Resource not available" unless resource.available?

    @user = user
    @resource = resource
    @status = "active"
    @created_at = Time.now

    resource.assign_booking(self)
  end

  def cancel
    raise BookingError, "Booking already cancelled" if @status == "cancelled"

    @status = "cancelled"
    resource.clear_booking
  end
  allowed_roles = ["student", "assistant"]
unless allowed_roles.include?(user.role)
  raise BookingError, "User not allowed to book"
  end
end