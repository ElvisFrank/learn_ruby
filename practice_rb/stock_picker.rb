class StockPicker
    def stock_picker days
        @days = days
        index_last = @days.length - 1
        
        result = {
            :buy => {
                :index => 0,
                :value => @days.first
            },
            :sell => {
                :index => index_last,
                :value => @days.last
            }}
        result[:profit] = result[:sell][:value] - result[:buy][:value]

        new_other = @days.sort
        new_other.map do |value_buy|
            index_buy = @days.index(value_buy)
            next if index_last == index_buy
            
            vector_for_search = @days[(index_buy + 1)...]
            value_sell = vector_for_search.max
            index_sell = 1 + index_buy + vector_for_search.index(value_sell)
            
            new_profit = value_sell - value_buy
            if(new_profit > result[:profit])
                result[:buy][:index] = index_buy
                result[:buy][:value] = value_buy
                result[:sell][:index] = index_sell
                result[:sell][:value] = value_sell
                result[:profit] = new_profit
            end
        end
        return result
    end

end

def stock_picker(prices)
    best_prices = [prices.first, prices.last]
    prices.combination(2).map { |e, i| best_prices = [e, i] if i - e > best_prices[1] - best_prices[0]}
    index_0 = prices.index(best_prices[0])
    vector_for_search = prices[(index_0 + 1)...]
    index_1 = 1 + index_0 + vector_for_search.index(best_prices[1])
            
    [index_0, index_1]
end
p stock_picker([17,3,6,9,15,8,6,1,10])
p stock_picker([20, 30, 9, 8, 12, 7, 2])
p stock_picker([2, 4, 30, 2, 40, 50, 7])
p stock_picker [1,3,6,9,15,8,6,10,16]
p stock_picker [1,3,6,9,15,8,6,10,12]
p stock_picker [17,3,6,9,15,8,6,10,2]
p stock_picker [10,13,16,9,15,8,6,10,2]
p stock_picker [3,2,3,4,5,6,6,2,10]
p stock_picker [54,46,40,32,32,28,21,15,10]
p stock_picker [77,66,56,42,38,28,20,13,10]

p 'aaaaaaaaaaaaaaaaaaaaaaaaaaa'

# frozen_string_literal: true

def stock_picker_1(stocks)
    min_price = nil
    max_profit = 0
    buy_date = nil
    sell_date = nil
    lowest_date = nil
  
    stocks.each_with_index do |stock, day|
      if min_price.nil? || (stock < min_price)
        min_price = stock
        lowest_date = day
      elsif stock - min_price > max_profit
        sell_date = day
        buy_date = lowest_date
        max_profit = stock - min_price
      end
    end
    [buy_date, sell_date]
  end
  
p stock_picker_1([17,3,6,9,15,8,6,1,10])
p stock_picker_1([20, 30, 9, 8, 12, 7, 2])
p stock_picker_1([2, 4, 30, 2, 40, 50, 7])
p stock_picker_1([1,3,6,9,15,8,6,10,16])
p stock_picker_1([1,3,6,9,15,8,6,10,12])
p stock_picker_1([17,3,6,9,15,8,6,10,2])
p stock_picker_1([10,13,16,9,15,8,6,10,2])
p stock_picker_1([3,2,3,4,5,6,6,2,10])
p stock_picker_1([54,46,40,32,32,28,21,15,10])
p stock_picker_1([77,66,56,42,38,28,20,13,10])
