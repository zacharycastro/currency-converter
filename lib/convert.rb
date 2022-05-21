require "./jsonReader.rb"
require "./requests.rb"
require "./format.rb"

def convertCrypto(coinOne, coinTwo)
    jsonData = readJson()
    jsonData["cryptoCurrency"].each do |keyOne, valueOne|
        jsonData["cryptoCurrency"].each do |keyTwo, valueTwo|
            if (coinOne == keyOne or valueOne) and (coinTwo == keyTwo or valueTwo)
                apiData = formatPrice(sendRequest(keyOne)) 
                return apiData["Price"][valueTwo]
            else
                return "error"
            end
        end
    end
end