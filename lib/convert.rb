require "./jsonReader.rb"
require "./requests.rb"
require "./format.rb"

def convertCrypto(coinOne, coinTwo)
    jsonData = readJson()
    jsonData["cryptoCurrency"].each do |keyOne, valueOne|
        jsonData["cryptoCurrency"].each do |keyTwo, valueTwo|
            if coinOne == keyOne or coinOne == valueOne
                apiData = formatPrice(sendRequest(keyOne)) 
                if coinTwo == valueTwo or coinTwo == keyTwo
                    return "#{apiData[:Price][valueTwo]} " + "#{valueTwo}"
                else
                    next
                end
            else
                return "error"
            end
        end
    end
end