class NotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.room_authorized.subject
  #
  def room_authorized(room)
    @room = room
    mail to: "#{room.user.email}", subject: "Your room #{room.name} has been authorized"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.booked_not_confirmed.subject
  #
  def booked_not_confirmed
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.booking_confirmed.subject
  #
  def booking_confirmed
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
