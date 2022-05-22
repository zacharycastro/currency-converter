require "json"

def readJson()
    rawData = File.open("./json/currency.json")
    jsonData = JSON.parse(rawData.read)
    rawData.close
    return jsonData
end