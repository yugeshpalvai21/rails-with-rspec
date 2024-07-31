# 01. Using Mocks

# app/models/order.rb
class Order
  attr_accessor :amount

  def initialize(amount: 0)
    self.amount = amount
  end

  def process_payment(payment_gateway)
    payment_gateway.charge(self.amount)
  end
end

# spec/models/order_spec.rb
RSpec.describe Order, type: :model do
  let(:order) { described_class.new(amount: 100) }
  let(:payment_gateway) { double('PaymentGateway') }

  it 'processes payment with the payment gateway' do
    # Setting an expectation on the mock
    expect(payment_gateway).to receive(:charge).with(100)

    order.process_payment(payment_gateway)
  end
end

# 02. stubs

# app/models/user.rb
class User
  attr_accessor :email

  def initialize(email)
    self.email = email
  end

  def send_welcome_email(email_service)
    email_service.send_email(self.email, 'Welcome!')
  end
end

# spec/models/user_spec.rb

describe User do
  let(:user) { described_class.new('test@example.com') }
  let(:email_service) { double('EmailService') }

  it 'sends a welcome email' do
    # Stubbing the send_email method on the email_service double with a response
    allow(email_service).to receive(:send_email).with('test@example.com', 'Welcome!').and_return(true)

    response = user.send_welcome_email(email_service)

    # Verify that the stubbed method was called
    expect(email_service).to have_received(:send_email).with('test@example.com', 'Welcome!')
    
    # Verify the response
    expect(response).to eq(true)
  end
end
