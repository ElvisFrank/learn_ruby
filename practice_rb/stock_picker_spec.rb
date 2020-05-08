$LOAD_PATH << "."
require 'stock_picker'

RSpec.describe StockPicker do
    before(:each) do
        @stock_prices = StockPicker.new
    end
    
    context 'when first is lowest' do
        it 'and last day is highest' do
            value_expec = @stock_prices.stock_picker [1,3,6,9,15,8,6,10,16]
            result = {:buy=>{:index=>0, :value=>1},
                :profit=>15,
                :sell=>{:index=>8, :value=>16}}
            expect(value_expec).to eq result
        end

        it 'and highest is middle' do
            value_expec = @stock_prices.stock_picker [1,3,6,9,15,8,6,10,12]
            result = {:buy=>{:index=>0, :value=>1},
                :profit=>14,
                :sell=>{:index=>4, :value=>15}}
            expect(value_expec).to eq result
        end
    end
    

    context 'when last is lowest' do
        it 'and first day is highest' do
            value_expec = @stock_prices.stock_picker [17,3,6,9,15,8,6,10,2]
            result = {:buy=>{:index=>1, :value=>3},
                :profit=>12,
                :sell=>{:index=>4, :value=>15}}
            expect(value_expec).to eq result
        end

        it 'and highest is middle' do
            value_expec = @stock_prices.stock_picker [10,13,16,9,15,8,6,10,2]
            result = {:buy=>{:index=>3, :value=>9},
                :profit=>6,
                :sell=>{:index=>4, :value=>15}}
            expect(value_expec).to eq result
        end
    end
    
    context 'when days are vaiables' do
        it 'ramdon values' do
            value_expec = @stock_prices.stock_picker [17,3,6,9,15,8,6,1,10]
            result = {:buy=>{:index=>1, :value=>3},
                :profit=>12,
                :sell=>{:index=>4, :value=>15}}
            expect(value_expec).to eq result
        end

        it 'ascending' do
            value_expec = @stock_prices.stock_picker [3,2,3,4,5,6,6,2,10]
            result = {:buy=>{:index=>1, :value=>2},
                :profit=>8,
                :sell=>{:index=>8, :value=>10}}
            expect(value_expec).to eq result
        end

        it 'min loss 0' do
            value_expec = @stock_prices.stock_picker [54,46,40,32,32,28,21,15,10]
            result = {:buy=>{:index=>3, :value=>32},
                :profit=>0,
                :sell=>{:index=>4, :value=>32}}
            expect(value_expec).to eq result
        end

        it 'loss min -number' do
            value_expec = @stock_prices.stock_picker [77,66,56,42,38,28,20,13,10]
            result = {:buy=>{:index=>7, :value=>13},
                :profit=>-3,
                :sell=>{:index=>8, :value=>10}}
            expect(value_expec).to eq result
        end
    end
end