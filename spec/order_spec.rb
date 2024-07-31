class Order
  attr_accessor :amount
  
  def initialize amount: 0
    @amount = amount
  end

  def process_payment payment_gateway
    payment_gateway.charge(amount)
    'success'
  end
end

describe Order do
  let(:order) { described_class.new(amount: 100) }
  let(:payment_gateway) { double('PaymentGateway') }

  it 'instantiate order object' do
    expect(order).to be_instance_of(Order)
  end

  it 'processes payment with payment gateway' do
    expect(payment_gateway).to receive(:charge).with(100)

    payment_process = order.process_payment(payment_gateway)
    expect(payment_process).to eq 'success'
  end
end