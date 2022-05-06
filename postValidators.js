db.createCollection("posts",{
    validator : {
        $jsonSchema :{
            bsonType : "object",
            required : ["title", "text", "creator", "comments"],
            properties :{
                title:{
                    bsonType : "string",
                    description : "Must be string  and it is required"
                },
                text:{
                    bsonType : "string",
                    description : "Must be objectId  and it is required"
                },
                creator:{
                    bsonType : "objectId",
                    description : "Must be objectId  and it is required"
                },
                comments:{
                    bsonType : "array",
                    description : "Must be array  and it is required",
                    items:{
                        bsonType : "object",
                        required : ["text", "author"],
                        properties:{
                            text:{
                                bsonType : "string",
                                description : "Must be objectId  and it is required"
                            },
                            author:{
                                bsonType : "objectId",
                                description : "Must be objectId  and it is required"
                            }
                        }
                    }
                }
            }
        }
    }
})

// This was fail because validation was fail
db.posts.insertOne({
    title :"Harry potter",
    text: "Look like good",
    tags: ["Movies" , "Magics"],
    creator: ObjectId("6269fe473c184fbcb2d5e626"),
    comments:[
        {
            text:"Part 1",
            author: 123456
        }
    ]
})
db.posts.find().pretty()

// This one sucess because follow the validation rules
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



// update the validation schema

db.runCommand({
    collMod : "posts",
    validator : {
        $jsonSchema :{
            bsonType : "object",
            required : ["title", "text", "creator", "comments"],
            properties :{
                title:{
                    bsonType : "string",
                    description : "Must be string  and it is required"
                },
                text:{
                    bsonType : "string",
                    description : "Must be objectId  and it is required"
                },
                creator:{
                    bsonType : "objectId",
                    description : "Must be objectId  and it is required"
                },
                comments:{
                    bsonType : "array",
                    description : "Must be array  and it is required",
                    items:{
                        bsonType : "object",
                        required : ["text", "author"],
                        properties:{
                            text:{
                                bsonType : "string",
                                description : "Must be objectId  and it is required"
                            },
                            author:{
                                bsonType : "objectId",
                                description : "Must be objectId  and it is required"
                            }
                        }
                    }
                }
            }
        }
    }
})