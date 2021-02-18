class JWT {
  final String uniqueName;
  final String sub;
  final int exp;
  final String iss;
  final String aud;

  JWT({
    this.uniqueName, 
    this.sub, 
    this.exp, 
    this.iss, 
    this.aud
  });

  JWT.fromJson(Map<String, dynamic> json) :
    uniqueName = json['unique_name'],
    sub = json['sub'],
    exp = json['exp'],
    iss = json['iss'],
    aud = json['aud'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unique_name'] = this.uniqueName;
    data['sub'] = this.sub;
    data['exp'] = this.exp;
    data['iss'] = this.iss;
    data['aud'] = this.aud;
    return data;
  }
}