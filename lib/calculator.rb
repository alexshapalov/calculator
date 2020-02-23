# frozen_string_literal: true

module Calculator
  # Calculator is an commission calculator gem
  class Commission
    DEFAULT_COMMISSION_AMOUNT = 0.1
    DEFAULT_COMMISSION_PERCENT = 20

    USER_COMMISSION_AMOUNT = {
      user1: 10,
      user2: 20,
      user3: 30
    }.freeze

    PRODUCT_COMMISSION_AMOUNT = {
      product1: 10,
      product2: 20,
      product3: 30
    }.freeze

    def self.call(amount:,
                  commission_amount: DEFAULT_COMMISSION_AMOUNT,
                  commission_percent: DEFAULT_COMMISSION_PERCENT,
                  commission_function: nil,
                  commission_entity: {})

      commission_amount = user_commission_amount(commission_entity) ||
                          product_commission_amount(commission_entity) ||
                          commission_amount

      if commission_function.nil?
        commission_total = (amount * (commission_percent * 0.01) + commission_amount).round(2)
        net_amount = amount - commission_total
        [net_amount, commission_total]
      else
        commission_function.call(amount, commission_amount, commission_percent)
      end
    end

    def self.user_commission_amount(commission_entity)
      user = commission_entity[:user]
      USER_COMMISSION_AMOUNT[user]
    end

    def self.product_commission_amount(commission_entity)
      product = commission_entity[:product]
      PRODUCT_COMMISSION_AMOUNT[product]
    end
  end
end
