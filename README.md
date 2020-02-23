# Calculator

Commission calculator gem

# Input 

 - amount *required

 - commission_amount *optional

 - commission_percent *optinal

 - commission_entity(user, product) *optional

 Output -

  [netto_amount, commission_amount]

# Example: 

Calculator.call(amount: 100, commission_amount: 1.0, commission_percent: 20)

commission_total = 100.0 * 0.2 + 1.0 = 21.0

net_amount = 100.0 - 21.0 = 79.0

 => [79.0, 21.0]