require "./jsonReader.rb"
require "./requests.rb"
require "./format.rb"

def convertCrypto(coinOne, coinTwo)
    jsonData = readJson()
    coinOneData = nil
    coinTwoData = nil
    jsonData["cryptoCurrency"].each do |key, value|
        if coinOne == key or coinOne == value
            coinOneData = formatPrice(sendRequest(key))[:Price]
        elsif coinTwo == key or coinTwo == value
            coinTwoData = formatPrice(sendRequest(key))[:Price]
        else
            next
        end
    end
    return coinOneData/coinTwoData
end