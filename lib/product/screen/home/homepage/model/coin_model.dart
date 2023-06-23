class Coin {
  Coin({
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.price,
    required this.changePercentage,
    required this.market_cap,
    required this.market_cap_rank,
    required this.high_24h,
    required this.low_24h,
    required this.ath,
    required this.ath_date,
  });

  String name;
  String symbol;
  String imageUrl;
  num price;
  num changePercentage;
  num market_cap;
  num market_cap_rank;
  num high_24h;
  num low_24h;
  num ath;
  String ath_date;

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      name: json['name'],
      symbol: json['symbol'],
      imageUrl: json['image'],
      price: json['current_price'],
      changePercentage: json['price_change_percentage_24h'],
      market_cap: json['market_cap'],
      market_cap_rank: json['market_cap_rank'],
      high_24h: json['high_24h'],
      low_24h: json['low_24h'],
      ath: json['ath'],
      ath_date: json['ath_date'],
    );
  }
}

List<Coin> coinList = [];
