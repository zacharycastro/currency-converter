require "./jsonReader.rb"
require "./requests.rb"
require "./format.rb"

def convert(currencyOne, currencyTwo)
    jsonData = readJson()
    currencyOneData = nil
    currencyOneType = nil
    currencyTwoData = nil
    currencyTwoType = nil

    jsonData.each do |keyOne, valueOne|
        jsonData[keyOne].each do |keyTwo, valueTwo|
            if keyOne == "cryptoCurrency"
                if currencyOne == keyTwo
                    currencyOneData, currencyOneType = sendRequest(keyTwo)
                    currencyOneData = formatPrice(currencyOneData, currencyOneType)[:Price]
                elsif currencyTwo == keyTwo
                    currencyTwoData, currencyTwoType = sendRequest(keyTwo)
                    currencyTwoData = formatPrice(currencyTwoData, currencyTwoType)[:Price]                     
                end

            elsif keyOne == "fiat"
                if currencyOne == keyTwo
                    currencyOneData, currencyOneType = sendRequest(keyTwo)
                    currencyOneData = formatPrice(currencyOneData, currencyOneType)[:Price]
                elsif currencyTwo == keyTwo
                    currencyTwoData, currencyTwoType = sendRequest(keyTwo)
                    currencyTwoData = formatPrice(currencyTwoData, currencyTwoType)[:Price]
                end
            end
        end
    end
    return "#{'%.2f' % (currencyOneData/currencyTwoData)}"
end