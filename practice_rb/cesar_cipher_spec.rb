$LOAD_PATH << "."
require 'cesar_cipher'
RSpec.describe CesarCipher do
    context 'whit encrypt process' do
        it 'encrypt' do
            expect(CesarCipher.encrypt('What a string!', 5)).to eq 'Bmfy f xywnsl!'
        end
    end

    context 'whit decrypt process' do
        it 'encrypt' do
            expect(CesarCipher.decrypt('Bmfy f xywnsl!', 5)).to eq 'What a string!'
        end
    end

    context 'whit encrypt_1 process' do
        it 'encrypt' do
            expect(CesarCipher.encrypt_1('What a string!', 5)).to eq 'Bmfy f xywnsl!'
        end
    end

    context 'whit decrypt_1 process' do
        it 'encrypt' do
            expect(CesarCipher.decrypt_1('Bmfy f xywnsl!', 5)).to eq 'What a string!'
        end
    end

    context 'whit encrypt_2 process' do
        it 'encrypt' do
            expect(CesarCipher.encrypt_2('What a string!', 5)).to eq 'Bmfy f xywnsl!'
        end
    end

    context 'whit decrypt_2 process' do
        it 'encrypt' do
            expect(CesarCipher.decrypt_2('Bmfy f xywnsl!', 5)).to eq 'What a string!'
        end
    end

end