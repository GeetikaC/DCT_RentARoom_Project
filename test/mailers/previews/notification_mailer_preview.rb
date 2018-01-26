# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/room_authorized
  def room_authorized
    NotificationMailer.room_authorized
  end

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/booked_not_confirmed
  def booked_not_confirmed
    NotificationMailer.booked_not_confirmed
  end

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/booking_confirmed
  def booking_confirmed
    NotificationMailer.booking_confirmed
  end

end
