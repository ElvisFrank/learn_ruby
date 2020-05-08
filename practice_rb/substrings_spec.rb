$LOAD_PATH << "."
require 'substrings'
RSpec.describe Substrings do
    context 'substrins method with dictionary' do
        before(:all) do
            @dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
        end

        it 'when used only word' do
            parameter = "below"
            result_expected = { "below" => 1, "low" => 1 }
            expect(Substrings.substrings parameter, @dictionary).to eq result_expected
        end

        it 'when used many words' do
            parameter = "Howdy partner, sit down! How's it going?"
            result_expected = { "down" => 1, "how" => 2, "howdy" => 1,"go" => 1, "going" => 1, "it" => 2, "i" => 3, "own" => 1,"part" => 1,"partner" => 1,"sit" => 1 }
            expect(Substrings.substrings parameter, @dictionary).to eq result_expected
        end
    end
end