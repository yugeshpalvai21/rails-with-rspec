class EmailService
  def self.send_mail(email, subject)
    # Implementation for sending email
  end
end

class User
  def send_welcome_email
    EmailService.send_mail('test@example.com', 'Welcome')
  end
end

describe User do
  it 'sends welcome email to user' do
    allow(EmailService).to receive(:send_mail).with('test@example.com', 'Welcome')

    user = User.new
    user.send_welcome_email

    expect(EmailService).to have_received(:send_mail).with('test@example.com', 'Welcome')
  end
end