class Currency
  def initialize(denominations = [])
    @denominations = denominations.sort { |a, b| b <=> a }
  end

  def num_ways(amount)
    count_num_ways(
      coins: @denominations, 
      size: @denominations.size, 
      amount: amount
    )
  end

  def min_change(amount)
    coins = []
    value = amount

    @denominations.each do |denomination|
      while value >= denomination do
        value -= denomination
        coins.push(denomination)
      end
    end

    coins.size
  end

  private 

  def count_num_ways(coins:, size:, amount:)
    return 1 if amount.zero?
    return 0 if amount.negative?
    return 0 if size <= 0

    count_num_ways(coins: coins, size: size - 1, amount: amount) +
      count_num_ways(coins: coins, size: size, amount: amount - coins[size - 1])
  end
end
