import 'package:postgresql2/postgresql.dart' as postgres;

const uri = 'postgres://postgres:sacha148@localhost:5432/bartenders?sslmode=disable';

Future<Object> insertCustomerPostgresql(
  String uid, 
  String firstName, 
  String lastName,
  String nickName,
  String gender,
  DateTime dateOfBirth, 
  String email,
  int phone,
  String address,
  String city,
  int zipCode,
  String location,
  String customerType,
  String workDays,
  int workHours,
  String serviceArea,
  String unavailableDates
  ) async{
    try {
      String sql1 = 'insert into customers values ';
      String sql2 = '(@uid, @firstName, @lastName, @nickName, @gender, @dateOfBirth, @email, @phone, @address,';
      String sql3 = ' @city, @zipCode, @location, @customerType, @workDays, @workHours, @serviceArea, @unavailableDates)';
      await postgres.connect(uri).then((conn) async {
        await conn.execute(sql1 + sql2 + sql3,
                    {'uid': uid, 'firstName': firstName, 'lastName': lastName, 'nickName': nickName, 'gender': gender, 
                    'dateOfBirth': dateOfBirth, 'email': email, 'phone': phone, 'address':address, 'city': city,
                    'zipCode': zipCode, 'location': location, 'customerType': customerType, 'workDays': workDays,
                    'workHours': workHours, 'serviceArea': serviceArea, 'unavailableDates': unavailableDates})
                    .then((_) { print('done.'); });
        conn.close();
      });
      return {"status":true,"description":"Done"};
    } catch (e){
      // Handle exceptions here, e.g., show an error message
      print('Error inserting customer: $e');
      return {"status":false,"description":'Error inserting customer. $e'};
    }
  }

  Future<Object> updateCustomerPostgresql(
    String uid, 
    String firstName, 
    String lastName,
    String nickName,
    String gender,
    DateTime dateOfBirth, 
    String email,
    int phone,
    String address,
    String city,
    int zipCode,
    String location,
    String customerType,
    String workDays,
    int workHours,
    String serviceArea,
    String unavailableDates
    ) async{
      try {
        String sql1 = 'update customers set "firstName" = @firstName, "lastName" = @lastName, "nickName" = @nickName, ';
        String sql2 = '"gender" = @gender, "dateOfBirth" = @dateOfBirth, "email" = @email, "phone" = @phone, "address" = @address, ';
        String sql3 = '"city" = @city, "zipCode" = @zipCode, "location" = @location, "customerType" = @customerType, "workDays" = @workDays, ';
        String sql4 = '"workHours" = @workHours, "serviceArea" = @serviceArea, "unavailableDates" = @unavailableDates where "uid" = @uid';
        await postgres.connect(uri).then((conn) async {
          await conn.execute(sql1 + sql2 + sql3 + sql4,
                      {'firstName': firstName, 'lastName': lastName, 'nickName': nickName, 'gender': gender, 
                      'dateOfBirth': dateOfBirth, 'email': email, 'phone': phone, 'address':address, 'city': city,
                      'zipCode': zipCode, 'location': location, 'customerType': customerType, 'workDays': workDays,
                      'workHours': workHours, 'serviceArea': serviceArea, 'unavailableDates': unavailableDates, 'uid': uid})
                      .then((_) { print('done.'); });
          conn.close();
        });
        return {"status":true,"description":"Done"};
      } catch (e){
        // Handle exceptions here, e.g., show an error message
        print('Error updating customer: $e');
        return {"status":false,"description":'Error updating customer. $e'};
      }
  }

  Future<Object> selectCustomerPostgresql(String uid) async{
    List  result = [];
    try {
      await postgres.connect(uri).then((conn) async {
      result = await conn.query('select * from customers where "uid" = @uid',
                  {'uid': uid}).toList();
      
      print(result[0]);
      conn.close();
      });
      return {"status":true,"description":result[0]};
    } catch (e){
      // Handle exceptions here, e.g., show an error message
      print('Error getting customer: $e');
      return {"status":false,"description":'Error getting customer. $e'};
    }
  }


  Future<Object> insertEventPostgresql(
    int eventId,
    String customerId, 
    String eventType, 
    String name,
    DateTime startDate,
    DateTime endDate,
    String address,
    String city,
    String state,
    String location,
    int numberBartender,
    int numberServer,
    int numberChef,
    int numberDj,
    int numberPlanner,
    int numberSecurity,
    int numberHost,
    int numberCleanUp
    ) async{
      try {
        String sql1 = 'insert into events values ';
        String sql2 = '(@eventId, @customerId, @eventType, @name, @startDate, @endDate, @address, @city, @state,';
        String sql3 = ' @location, @numberBartender, @numberServer, @numberChef, @numberDj, @numberPlanner, @numberSecurity, ';
        String sql4 = '@numberHost, @numberCleanUp)';
        await postgres.connect(uri).then((conn) async {
          await conn.execute(sql1 + sql2 + sql3 + sql4,
                      {'eventId': eventId, 'customerId': customerId, 'eventType': eventType, 'name': name, 'startDate': startDate, 
                      'endDate': endDate, 'address': address, 'city': city, 'state':state, 'location': location,
                      'numberBartender': numberBartender, 'numberServer': numberServer, 'numberChef': numberChef, 'numberDj': numberDj,
                      'numberPlanner': numberPlanner, 'numberSecurity': numberSecurity, 'numberHost': numberHost, 'numberCleanUp': numberCleanUp})
                      .then((_) { print('done.'); });
          conn.close();
        });
        return {"status":true,"description":"Done"};
      } catch (e){
        // Handle exceptions here, e.g., show an error message
        print('Error inserting event: $e');
        return {"status":false,"description":'Error inserting event. $e'};
      }
  }

  Future<Object> updateEventPostgresql(
    int eventId,
    String eventType, 
    String name,
    DateTime startDate,
    DateTime endDate,
    String address,
    String city,
    String state,
    String location,
    int numberBartender,
    int numberServer,
    int numberChef,
    int numberDj,
    int numberPlanner,
    int numberSecurity,
    int numberHost,
    int numberCleanUp
    ) async{
      try {
        String sql1 = 'update events set "eventType" = @eventType, "name" = @name, "startDate" = @startDate, ';
        String sql2 = '"endDate" = @endDate, "address" = @address, "city" = @city, "state" = @state, "location" = @location, ';
        String sql3 = '"numberBartender" = @numberBartender, "numberServer" = @numberServer, "numberChef" = @numberChef, "numberDj" = @numberDj,  ';
        String sql4 = '"numberPlanner" = @numberPlanner, "numberSecurity" = @numberSecurity, "numberHost" = @numberHost , ';
        String sql5 = '"numberCleanUp" = @numberCleanUp where "eventId" = @eventId';
        await postgres.connect(uri).then((conn) async {
          await conn.execute(sql1 + sql2 + sql3 + sql4 + sql5,
                      {'eventType': eventType, 'name': name, 'startDate': startDate, 'endDate': endDate, 
                      'address': address, 'city': city, 'state': state, 'location':location, 'numberBartender': numberBartender,
                      'numberServer': numberServer, 'numberChef': numberChef, 'numberDj': numberDj, 'numberPlanner': numberPlanner,
                      'numberSecurity': numberSecurity, 'numberHost': numberHost, 'numberCleanUp': numberCleanUp, 'eventId': eventId})
                      .then((_) { print('done.'); });
          conn.close();
        });
        return {"status":true,"description":"Done"};
      } catch (e){
        // Handle exceptions here, e.g., show an error message
        print('Error updating event: $e');
        return {"status":false,"description":'Error updating event. $e'};
      }
  }

  Future<Object> selectEventPostgresql(int eventId) async{
    List  result = [];
    try {
      await postgres.connect(uri).then((conn) async {
      result = await conn.query('select * from events where "eventId" = @eventId',
                  {'eventId': eventId}).toList();
      
      print(result[0]);
      conn.close();
      });
      return {"status":true,"description":result[0]};
    } catch (e){
      // Handle exceptions here, e.g., show an error message
      print('Error getting event: $e');
      return {"status":false,"description":'Error getting event. $e'};
    }
  }


  Future<Object> insertJobPostgresql(
    int jobId,
    int eventId, 
    String position, 
    String experience,
    String state
    ) async{
      try {
        String sql1 = 'insert into jobs values ';
        String sql2 = '(@jobId, @eventId, @position, @experience, @state)';
        await postgres.connect(uri).then((conn) async {
          await conn.execute(sql1 + sql2,
                      {'jobId': jobId, 'eventId': eventId, 'position': position, 'experience': experience, 'state': state})
                      .then((_) { print('done.'); });
          conn.close();
        });
        return {"status":true,"description":"Done"};
      } catch (e){
        // Handle exceptions here, e.g., show an error message
        print('Error inserting job: $e');
        return {"status":false,"description":'Error inserting job. $e'};
      }
  }

  Future<Object> updateJobPostgresql(
    int jobId,
    String position, 
    String experience,
    String state
    ) async{
      try {
        String sql1 = 'update jobs set "position" = @position, "experience" = @experience, "state" = @state ';
        String sql2 = 'where "jobId" = @jobId';
        await postgres.connect(uri).then((conn) async {
          await conn.execute(sql1 + sql2,
                      {'position': position, 'experience': experience, 'state': state, 'jobId': jobId})
                      .then((_) { print('done.'); });
          conn.close();
        });
        return {"status":true,"description":"Done"};
      } catch (e){
        // Handle exceptions here, e.g., show an error message
        print('Error updating job: $e');
        return {"status":false,"description":'Error updating job. $e'};
      }
  }


  Future<Object> selectJobPostgresql(int jobId) async{
    List  result = [];
    try {
      await postgres.connect(uri).then((conn) async {
      result = await conn.query('select * from jobs where "jobId" = @jobId',
                  {'jobId': jobId}).toList();
      
      print(result[0]);
      conn.close();
      });
      return {"status":true,"description":result[0]};
    } catch (e){
      // Handle exceptions here, e.g., show an error message
      print('Error getting job: $e');
      return {"status":false,"description":'Error getting job. $e'};
    }
  }


  Future<Object> insertServicePostgresql(
    int serviceId,
    String customerId, 
    String serviceName, 
    int hourlyRate,
    int yearsExperience,
    String certificateUrl,
    String description
    ) async{
      try {
        String sql1 = 'insert into services values ';
        String sql2 = '(@serviceId, @customerId, @serviceName ,@hourlyRate, @yearsExperience, @certificateUrl, @description)';
        await postgres.connect(uri).then((conn) async {
          await conn.execute(sql1 + sql2,
                      {'serviceId': serviceId, 'customerId': customerId, 'serviceName': serviceName, 'hourlyRate': hourlyRate,
                      'yearsExperience': yearsExperience, 'certificateUrl': certificateUrl, 'description': description})
                      .then((_) { print('done.'); });
          conn.close();
        });
        return {"status":true,"description":"Done"};
      } catch (e){
        // Handle exceptions here, e.g., show an error message
        print('Error inserting service: $e');
        return {"status":false,"description":'Error inserting service. $e'};
      }
  }


  Future<Object> updateServicePostgresql(
    int serviceId,
    String serviceName, 
    int hourlyRate,
    int yearsExperience,
    String certificateUrl,
    String description
    ) async{
      try {
        String sql1 = 'update services set "serviceName" = @serviceName, "hourlyRate" = @hourlyRate, "yearsExperience" = @yearsExperience, ';
        String sql2 = '"certificateUrl" = @certificateUrl, "description" = @description  where "serviceId" = @serviceId';
        await postgres.connect(uri).then((conn) async {
          await conn.execute(sql1 + sql2,
                      {'serviceName': serviceName, 'hourlyRate': hourlyRate, 'yearsExperience': yearsExperience,
                       'certificateUrl': certificateUrl, 'description': description,'serviceId': serviceId})
                      .then((_) { print('done.'); });
          conn.close();
        });
        return {"status":true,"description":"Done"};
      } catch (e){
        // Handle exceptions here, e.g., show an error message
        print('Error updating service: $e');
        return {"status":false,"description":'Error updating service. $e'};
      }
  }


  Future<Object> selectServicePostgresql(int serviceId) async{
    List  result = [];
    try {
      await postgres.connect(uri).then((conn) async {
      result = await conn.query('select * from services where "serviceId" = @serviceId',
                  {'serviceId': serviceId}).toList();
      
      print(result[0]);
      conn.close();
      });
      return {"status":true,"description":result[0]};
    } catch (e){
      // Handle exceptions here, e.g., show an error message
      print('Error getting service: $e');
      return {"status":false,"description":'Error getting service. $e'};
    }
  }


  Future<Object> insertApplicationPostgresql(
    int applicationId,
    String customerId, 
    int jobId,
    String state
    ) async{
      try {
        String sql1 = 'insert into applications values ';
        String sql2 = '(@applicationId, @customerId, @jobId, @state)';
        await postgres.connect(uri).then((conn) async {
          await conn.execute(sql1 + sql2,
                      {'applicationId': applicationId, 'customerId': customerId, 'jobId': jobId, 'state': state})
                      .then((_) { print('done.'); });
          conn.close();
        });
        return {"status":true,"description":"Done"};
      } catch (e){
        // Handle exceptions here, e.g., show an error message
        print('Error inserting application: $e');
        return {"status":false,"description":'Error inserting application. $e'};
      }
  }


  Future<Object> updateApplicationPostgresql(
    int applicationId,
    String state
    ) async{
      try {
        String sql1 = 'update applications set "state" = @state where "applicationId" = @applicationId';
        await postgres.connect(uri).then((conn) async {
          await conn.execute(sql1,
                      {'state': state, 'applicationId': applicationId})
                      .then((_) { print('done.'); });
          conn.close();
        });
        return {"status":true,"description":"Done"};
      } catch (e){
        // Handle exceptions here, e.g., show an error message
        print('Error updating application: $e');
        return {"status":false,"description":'Error updating application. $e'};
      }
  }


  Future<Object> selectApplicationPostgresql(int applicationId) async{
    List  result = [];
    try {
      await postgres.connect(uri).then((conn) async {
      result = await conn.query('select * from applications where "applicationId" = @applicationId',
                  {'applicationId': applicationId}).toList();
      
      print(result[0]);
      conn.close();
      });
      return {"status":true,"description":result[0]};
    } catch (e){
      // Handle exceptions here, e.g., show an error message
      print('Error getting application: $e');
      return {"status":false,"description":'Error getting application. $e'};
    }
  }