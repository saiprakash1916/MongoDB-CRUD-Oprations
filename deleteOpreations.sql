db.users.deleteOne({name : "Maria"})

db.users.deleteMany({age : {$gt : 25}, isSporty : true})


--Delete all documents
db.users.deleteMany({})

-- Delete the collection it self
db.users.drop()

-- Delete the database
db.dropDatabase()