require "./jsonReader.rb"
require "./requests.rb"

def formatPrice(req, currency)
    jsonData = readJson()

    jsonData.each do |keyOne, valueOne|
        jsonData[keyOne].each do |keyTwo, valueTwo|
            if keyOne == "cryptoCurrency" and currency == keyTwo
                return {"ID": req["id"], "Price": req["market_data"]["current_price"]["usd"]}
            elsif keyOne == "fiat" and currency == keyTwo
                if req["base"] == "USD"
                    return {"ID": req["base"], "Price": 1.00}
                else
                    return {"ID": req["base"], "Price": req["rates"]["USD"]}
                end
            end
        end
    end
end