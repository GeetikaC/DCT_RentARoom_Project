require 'test_helper'

class NotificationMailerTest < ActionMailer::TestCase
  test "room_authorized" do
    mail = NotificationMailer.room_authorized
    assert_equal "Room authorized", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "booked_not_confirmed" do
    mail = NotificationMailer.booked_not_confirmed
    assert_equal "Booked not confirmed", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "booking_confirmed" do
    mail = NotificationMailer.booking_confirmed
    assert_equal "Booking confirmed", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
