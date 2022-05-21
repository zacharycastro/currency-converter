require "uri"
require "net/http"
require "json"

def sendRequest(coin)
    begin
        if coin == nil
            sendUrl = URI("https://api.coingecko.com/api/v3/coins/bitcoin")
        else
            sendUrl = "https://api.coingecko.com/api/v3/coins/" + coin
            sendUrl = URI(sendUrl)
        end
        return JSON.parse(Net::HTTP.get_response(sendUrl).body)
    rescue => exception
        return exception    
    end 
end