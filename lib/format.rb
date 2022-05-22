def formatPrice(req)
    return {"ID": req["id"], "Price": req["market_data"]["current_price"]["usd"]}
end