-- data schema and Data modelling

use shop

db.products.insertOne({
    name : "A Book",
    price : 12.99
})

db.products.insertOne({
    title : "T-Shirt",
    price : 12.99,
    seller : {name : "sai", age : 25}
})
db.products.find().pretty()

db.products.deleteMany({})

db.products.insertOne({
    name : "A Book",
    price : 12.99
})

db.products.insertOne({
    name : "T-shirt",
    price : 19.99
})

db.products.insertOne({
    name : "computer",
    price : 123456,
    details : {
        cpu : "i7"
    }
})



-- CompanyData

db.companies.insertOne({
    name "Virtus",
    isStartUp : false,
    employees : 1000,
    funding : 123456789,
    details :{
        CEO : "xyz"
    },
    tags :[
        {title:"super"},
        {title:"perfect"}
    ],
    foundingDate : new Data(),
    insertedAt : new Timestamp()
})

db.numbers.insertOne({a:1})
--To check how many collection inside one object

db.stats()

-- If drop (delete) the collection

db.companies.drop()

-- Detele many

db.companies.deleteMany({})

-- To find the datatype
typeof db.numbers.findOne().a

-- If remove database
db.dropDatabase()

-- To see colelctions
show collection or db.getCollectionNames()
db.collectionname.drop()


-- One to Many
use cityData

db.cities.insertOne({
    name : "Guntur",
    coordinates :{
        lat :23,
        long:56
    }
})

db.citizens.insertMany([
    {
    name " sai",
    cityId : ObjectId("6268b88522cd7c1477395231")
    },
    {
    name " prakash",
    cityId : ObjectId("6268b88522cd7c1477395231")
    }
])

-- Many to Many relationship (customers and products)

use shop

db.products.insertOne({title: "A Book", price: 12.99})

db.customers.insertOne({name: "venkat", age: 32})

db.orders.insertOne(
    {
        productId: ObjectId("6268b9e7389f4185fef630ae"),
        customerId:  ObjectId("6268b9ef389f4185fef630af")
    }
)

db.orders.drop()

db.customers.updateOne(
    {},
    {
        $set : {
            orders: [
                {
                    productId: ObjectId("6268b9e7389f4185fef630ae"),
                    quantity: 2
                }
            ]
        }
    }
)

db.customers.updateOne(
    {},
    {
        $set : {
            orders: [
                {
                    title: "A Book",
                    price: 12.99,
                    quantity: 2
                }
            ]
        }
    }
)

-- Many to Many relationship (Book and Authores)

use bookregistry

db.books.insertOne({
    name : "My fav book",
    Authores :[
        {
            name : "Sai",
            age : 25
        },
        {
            name : "prakash",
            age : 23
        }
    ]
})

db.authors.insertMany([
    {
        name : "Sai",
            age : 25,
            address : {
                city : "Guntur"
            }    
    },
    {
            name : "prakash",
            age : 23,
            address : {
                city : "Hyderabad"
            }
        }   
])

db.books.updateOne(
    {},
    {
        $set :{
            authors :[
                ObjectId("6269f2d33c184fbcb2d5e621"),
                ObjectId("6269f2d33c184fbcb2d5e622")
            ]
        }
    }
)

db.books.find().pretty()
db.authors.find().pretty()


-- $lookup Querys for joins

db.books.aggregate(
    [
        {
            $lookup :{
                from : "authors",
                localField : "authors",
                foreignField: "_id",
                as:"creators"
            }
        }
    ]
).pretty()



-- Users data blog

use blog

db.users.insertMany([
    {
        name : "Sai",
        age : 24,
        email : "sai@gmail.com"    
    },
    {
        name : "prakash",
        age : 23,
        email : "prakash@gmail.com"
    }, 
    {
        name : "Dinu",
        age : 23,
        email : "dinu@gmail.com"
    }
])
-- Id's for users
{
        "acknowledged" : true,
        "insertedIds" : [
                ObjectId("6269fe473c184fbcb2d5e626"),
                ObjectId("6269fe473c184fbcb2d5e627"),
                ObjectId("6269fe473c184fbcb2d5e628")
        ]
}

db.users.find().pretty()



db.posts.insertOne({
    title :"Harry potter",
    text: "Look like good",
    tags: ["Movies" , "Magics"],
    creator: ObjectId("6269fe473c184fbcb2d5e626"),
    comments:[
        {
            text:"Part 1",
            author: ObjectId("6269fe473c184fbcb2d5e628")
        }
    ]
})

db.posts.find().pretty()

db.posts.drop()

Show collections