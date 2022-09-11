import 'package:gsheets/gsheets.dart';

const credentials = {
  "type": "service_account",
  "project_id": "jatayat-e6cb5",
  "private_key_id": "a5e1b28aded4387bc5a0283f80a8002baffe8c6b",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC7Rc7QFBHhidMU\nr6Oj65ERVYjAEYbS+fpY8HGZOOo5JUCvsuIQ5WbxEwqz6LRoIBlmLmJEZ8XDykml\nZ/9M02b/C+wlgCVF4Rr4djsiz1CWQxvWpm+Aye3iky8LMN6QrW/SwxhzRL2yzEbZ\nA2sCmsZY2pHhQVIAopUzKBuQwFE5gafdxcGCy8mODTGqPUNIrshZNJUzQXxHPvy3\nkwCnjLdjEW6yg8xnUNnUMdT0aaqDqVUrjO+9j05r8z0zf0+/QdHhxtHrjPe/oe5u\njVThX5euWpL4dfiUM/EEwAMYzHXBuc4C4Jh80D3PZ6WPJ3TwdDJDqL7KljKq+5H0\nZBKxTUAHAgMBAAECggEAQElu/PQezUc0XEINEUzhAEvWBWUe3Nbub1CfFoO4uARH\nR+lG/JjbdT9dqbPlFmeKgI7EsgnTlGohTPQ96kAZ98y+dIMgiHQFf6yKkWEMn4CL\nEm0REut+y4xOFm/gv1aib/4EKzG6UyIX4hBv0DWUiFUDxglX3prxT93hVJgIag43\nXgWpLg3y+NOn41PMZWjMPhMjAG7qA2zo0kU5x1fiLEqdurTQukkfHc2SjIPvDeg8\nkJ2OT9sd6V4KLDtKkgfzJf5SL9Sgi3CTaq8ZIj1rDQfOVBa2OtOnf7EdOycBF3nl\nveMR56wEkHUv5hA+La+k8KaR+QdRSKZwr1vLb8aTMQKBgQDc0dcHvh54UxAJ8ZvV\nRumI5MnNYuC5v3djZs4yohxfASPPxohpnpLqTbJdbw7fDGDNagY9w63uQ6rzDRo9\ne7Z0zeBQyhc3ZQ1VFr9mrIo8U4ZVIcxvVia1mZat0+7Rjv2+bpdy3Liq61oeTltc\nZVH6+1lOzGuj0DY9eFbt0kBcMQKBgQDZG7/DFdM/wThlz6dpnLvY2H9F94jCAMp9\n9sQE4PqCZ0GJCUbdItqygZGSlzVlkvoCcNd4XXEuT8eTPXu5PHpPX1C7PeMN329i\nrkjzjm5xBWWX5i7MUkd9NVH62pJMSK9WK+zMCoVpujh668tQS8Eg5vfaASrA7DfR\nAfoqhp+ptwKBgGrd7ygjHZHz+Q4m7NjyAbGrr/KDSOj8PaZQqbgddoeQAKnclkYv\nZUCZq5nGVrchwXOIPU8E9ZcbDo+kJq/cwHeU71uKAmRftm0Ynjbth9UcQyXOPqcf\nVYqLsz2bFLg8cJcJ5KfFJGYrkqiaGWME8gD6RcV57xoPeUCUjdV47IbxAoGAVaed\nAFqb/Ys9tO04H3K2qdbAX9pJGkE1ony42TPpoYkbUfVW/+fAYKy9whfl+S0DdfMP\nD23OOXdARdb7+RjjKG1ybGz+J3r/du9L2MtYxz5Z1pP54qKTkdJ3hYC2N2J1yomJ\n4vZDrHLL1bMxg3xftZtqLZhIRdTsMImXKS/zzgECgYBgRPWTC4vznb5zOUlFhyOM\n4rtcT/FwZPk6MJih+g0Kb3jqJ7jCObzP/dsYOZ92Tq5JRmXHIlqOeM42X5dN8s5X\nJtQ2+kA4qkBB+STsuo9C0e32sAKTEsw8mjddwu55s16YjscgJgul48EuP13vwGth\nSEgFfUgnl2N852/htQxkRQ==\n-----END PRIVATE KEY-----\n",
  "client_email": "jatayat@jatayat-e6cb5.iam.gserviceaccount.com",
  "client_id": "115503126911257490218",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/jatayat%40jatayat-e6cb5.iam.gserviceaccount.com"
};

Future<List<List<String>>> gsheetsRows(delay,title) async {
  try{
    while(true){
      await Future.delayed(Duration(milliseconds: delay));
      // Stream.periodic(Duration(milliseconds: delay));
      var sheetsId = '1hDzz0w4JJOxv1QUYTheGcqY1ZBTZ8fHElCY8Y2bvW7w';
      final gsheets = GSheets(credentials);
      final ss = await gsheets.spreadsheet(sheetsId);
      var sheet = ss.worksheetByTitle(title);
      var alRows = await sheet!.values.allRows();
      return alRows;
    }
  }
  catch(e){
    throw 'Something is wrong';
  }
}

Future<List<List<String>>> gsheetsColumn(delay,title) async {
  try{
    while(true){
      await Future.delayed(Duration(milliseconds: delay));
      // Stream.periodic(Duration(milliseconds: delay));
      var sheetsId = '1hDzz0w4JJOxv1QUYTheGcqY1ZBTZ8fHElCY8Y2bvW7w';
      final gsheets = GSheets(credentials);
      final ss = await gsheets.spreadsheet(sheetsId);
      var sheet = ss.worksheetByTitle(title);
      var alRows = await sheet!.values.allColumns();
      return alRows;
    }
  }
  catch(e){
    throw 'Something is wrong';
  }
}