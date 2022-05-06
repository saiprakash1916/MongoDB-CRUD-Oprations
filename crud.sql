db.flightData.insertOne({
      "departureAirport": "MUC",
      "arrivalAirport": "SFO",
      "aircraft": "Airbus A380",
      "distance": 12000,
      "intercontinental": true
    })

db.flightData.find().pretty()
--update only one document
db.flightData.updateOne({distance:12000} ,{$set:{marker:"delete"}})
--update multipme one document
db.flightData.updateOne({} ,{$set:{marker:"delete"}})

db.flightData.deleteMany({marker : "delete"})

db.flightData.insertMany([
    {
      "departureAirport": "MUC",
      "arrivalAirport": "SFO",
      "aircraft": "aircraft",
      "distance": 12000,
      "intercontinental": true
    },
    {
      "departureAirport": "LHR",
      "arrivalAirport": "TXL",
      "aircraft": "Airbus A320",
      "distance": 950,
      "intercontinental": false
    }
  ])

db.flightData.find({intercontinental : true}).pretty()
db.flightData.find({aircraft : "Airbus A320"}).pretty()
--grather than
db.flightData.find({distance : {$gt:900}}).pretty()
--First document of match  (pretty not requried becaues only one match)
db.flightData.findOne({distance : {$gt:900}})


--updateone object
db.flightData.updateOne({ "_id" : ObjectId("626759e90a75e6901b9690f1")}, {$set:{delayed : true}})
--update 
db.flightData.update({ "_id" : ObjectId("626759e90a75e6901b9690f1")}, {$set:{delayed : true}})
--by using update without using atomic filters that time document will be modified
db.flightData.update({ "_id" : ObjectId("626759e90a75e6901b9690f1")}, {delayed : true})

--passengers collection

db.passengersList.insertMany([
    {
      "name": "Max Schwarzmueller",
      "age": 29
    },
    {
      "name": "Manu Lorenz",
      "age": 30
    },
    {
      "name": "Chris Hayton",
      "age": 35
    },
    {
      "name": "Sandeep Kumar",
      "age": 28
    },
    {
      "name": "Maria Jones",
      "age": 30
    },
    {
      "name": "Alexandra Maier",
      "age": 27
    },
    {
      "name": "Dr. Phil Evans",
      "age": 47
    },
    {
      "name": "Sandra Brugge",
      "age": 33
    },
    {
      "name": "Elisabeth Mayr",
      "age": 29
    },
    {
      "name": "Frank Cube",
      "age": 41
    },
    {
      "name": "Karandeep Alun",
      "age": 48
    },
    {
      "name": "Michaela Drayer",
      "age": 39
    },
    {
      "name": "Bernd Hoftstadt",
      "age": 22
    },
    {
      "name": "Scott Tolib",
      "age": 44
    },
    {
      "name": "Freddy Melver",
      "age": 41
    },
    {
      "name": "Alexis Bohed",
      "age": 35
    },
    {
      "name": "Melanie Palace",
      "age": 27
    },
    {
      "name": "Armin Glutch",
      "age": 35
    },
    {
      "name": "Klaus Arber",
      "age": 53
    },
    {
      "name": "Albert Twostone",
      "age": 68
    },
    {
      "name": "Gordon Black",
      "age": 38
    }
  ])



  --- Update array in PassengersList collection

  db.PassengersList.updateOne({

  })