use user

db.users.find().pretty()

-- Update one doument by using id
db.users.updateOne(
    {_id : ObjectId("6271de0720ea18980c40f124")},
    {
        $set:{
            hobbies :[
                {title : "Sports" , frequency : 5},
                {title : "Cooking" , frequency : 3},
                {title : "hiking" , frequency : 1}
            ]
        }
    }
)

-- Updating the multiple objectes with matching content
db.users.updateMany(
    {"hobbies.title" : "Sports"},
    {
        $set : {isSporty : true}
    }
)

-- Updateing the values or adding the values by usng $set
db.users.updateOne(
    {_id : ObjectId("6271de0720ea18980c40f124")},
    {
        $set:{
            age : 30
        }
    }
)

-- Increment the age 
db.users.updateOne(
    {name : "venkat"},
    {
        $inc : {age : 1}
    }
)

-- Decrement value is age
db.users.updateOne(
    {name : "venkat"},
    {
        $inc : {age : -40}
    }
)

db.users.updateOne(
    { name: "Chris"},
    { $min: {age: 36}}
)

db.users.updateOne(
    { name: "Chris"},
    { $max: {age: 36}}
)

-- Multiple the age
db.users.updateOne(
    { name: "Chris"},
    { $mul: {age: 1.1}}
)

-- set the filed as null
db.users.updateMany({isSporty: true}, {$set: {phone: null}})

-- remove the filed
db.users.updateMany({isSporty: true}, {$unset: {phone: ""}})

--rename fields
db.users.updateMany({}, { $rename : { age: "totalAge" }})

-- upsert ( It used to featch the data if in case data is not available it will create new data)
db.users.updateOne(
    {name : "Maria"},
    {$set:{
        age : 29,
        hobbies :[
            {
                title : "Good food",
                frequency : 3
            }
        ],
        isSporty : true
    }},
    {upsert : true}
)

-- Updating array elements by using find and update
db.users.find(
    {
        hobbies :{
            $elemMatch :{
                title :"Sports",
                frequency :{
                    $gte : 3
                }
            }
        }
    }
).count()

-- Updating the object by using $elemMatch and adding the new values to that object
db.users.updateMany(
    {
        hobbies :{
            $elemMatch :{
                title :"Sports",
                frequency :{
                    $gte : 3
                }
            }
        }
    },
    {
        $set :{
            "hobbies.$.highFrequency" : true
        }
    }
)

db.users.find({"hobbies.frequency" : {$gt : 2}}).pretty()
db.users.find({"hobbies.frequency" : {$gt : 2}}).count()

-- Adding the new value in hobbies by using frequency value
db.users.updateMany(
    {"hobbies.frequency" : {$gt : 2}},
    {
        $set :{
            "hobbies.$[el].goodFrequency" : true
        }
    },
    {
        arrayFilters :[ {"el.frequency" : { $gt: 2}}]
    }
)

db.user.updateMany(
    {age : {$gt : 25}},
    {
        $inc :{
            "hobbies.frequency" : 1
        }
    }
)

-- Adding new elements to an array  ( This approach is creating the multiple duplicate values)

db.users.updateOne(
    {name : "Maria"},
    {
        $push:{
            hobbies :{
                title : "Sports",
                frequency : 2
            }
        }
    }
)

-- Adding th elements in array and adding also sorting order
db.users.updateOne(
    {name : "Maria"},
    {
        $push:{
            hobbies :{
                $each:[
                    {title : "Good wine" , frequency : 1},
                    {title : "Hiking" , frequency : 2}
                ],
                $sort :{frequency :-1}
            }
        }
    }
)

-- Removieing the object in array with based on title remove all with same title
db.users.updateOne(
    {name : "Maria"},
    {
        $pull :{
            hobbies : {title : "Good wine"}
        }
    }
)

-- Remove the last array in that object
db.users.updateOne(
    {name : "Maria"},
    {
        $pop :{
            hobbies : 1
        }
    }
)

-- addToSet is used to add the values and it would be avoid the duplicated( If the values in there in that object that one it was not add)
db.users.updateOne(
    {name : "Maria"},
    {
        $addToSet :{
            hobbies : {title : "Hiking" , frequency : 2}
        }
    }
)