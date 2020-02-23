# frozen_string_literal: true

RSpec.describe Calculator::Commission do
  describe 'calculate commission' do
    it 'main test' do
      calculator = Calculator::Commission.call( 
        amount: 100, 
        commission_amount: 1.0, 
        commission_percent: 20, 
     )

      expect(calculator).to eql([79.0, 21.0])
    end

    it 'with default commission amount' do
      calculator = Calculator::Commission.call(
        amount: 100, 
        commission_percent: 20, 
    )

      expect(calculator).to eql([79.9, 20.1])
    end

    it 'with default commission percent' do
      calculator = Calculator::Commission.call(
        amount: 100 
    )

      expect(calculator).to eql([79.9, 20.1])
    end

    it 'with commission function' do
      proc = Proc.new do |amount, commission_amount, commission_percent|
        commission_total = (amount * (commission_percent * 0.01) + 10*commission_amount).round(2)
        net_amount = amount - commission_total
        [net_amount, commission_total]
      end

      calculator = Calculator::Commission.call(
        amount: 100,
        commission_percent: 20,
        commission_amount: 1.0,
        commission_function: proc
    )

      expect(calculator).to eql([70.0, 30.0])
    end

    it 'amount is required ArgumentError:' do
      expect { Calculator::Commission.call() }.to raise_error(an_instance_of(ArgumentError).and having_attributes(message: "missing keyword: :amount"))
    end

    it 'with default commission entity and commission_amount for user1' do
      calculator = Calculator::Commission.call(
        amount: 100,
        commission_entity: { user: :user1 }
    )

      expect(calculator).to eql([70.0, 30.0])
    end

    it 'with default commission entity and commission_amount for product1' do
      calculator = Calculator::Commission.call(
        amount: 100,
        commission_entity: { product: :product1 }
    )

      expect(calculator).to eql([70.0, 30.0])
    end
  end
end

