require "uri"
require "net/http"
require "json"

require "./jsonReader.rb"

def sendRequest(currency)
    jsonData = readJson()
    currencyName = currency
    begin
        jsonData.each do |keyOne, valueTwo|
        jsonData[keyOne].each do |keyTwo, valueTwo|
            if keyOne == "cryptoCurrency" and currency == keyTwo
                sendUrl = "https://api.coingecko.com/api/v3/coins/" + currency
                sendUrl = URI(sendUrl)
                return JSON.parse(Net::HTTP.get_response(sendUrl).body), currencyName
            elsif keyOne == "fiat" and currency == keyTwo
                sendUrl = "https://www.currency-api.com/rates?base=" + valueTwo.upcase
                sendUrl = URI(sendUrl)
                return JSON.parse(Net::HTTP.get_response(sendUrl).body), currencyName
            end
        end
        end
    rescue => exception
        return exception    
    end 
end