require "json"

def readJson()
    rawData = File.open("./json/coin.json")
    jsonData = JSON.parse(rawData.read)
    rawData.close
    return jsonData
end