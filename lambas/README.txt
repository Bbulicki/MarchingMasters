uploadDocuments
    description: upload a file for a user_id
    link: https://zbi1wtjll8.execute-api.us-east-1.amazonaws.com/v1/uploaddocuments
    queryParameters: 
        user_id: value of user_id
        filename: filename for the uploaded file
    body: 
        upload a file to body field
    response: 
        "upload successful"
    error handling:
        none


retrieveDocuments
    description: retrieves a list of links of s3 bucket documents associated w/ the user
    link: https://zbi1wtjll8.execute-api.us-east-1.amazonaws.com/v1/retrievedocuments
    queryParameters: 
        user_id: value of user_id 
    response: 
        type: json
        example: 
            {
                "documents": [
                    "https://mmdrexel.s3.amazonaws.com/test_user/addasdes.csv",
                    "https://mmdrexel.s3.amazonaws.com/test_user/addresses.csv",
                    "https://mmdrexel.s3.amazonaws.com/test_user/addresses1.csv",
                    "https://mmdrexel.s3.amazonaws.com/test_user/test.txt"
                ]
            }
    error handling:
        none


joinBand
    description: join a band (for performers)
    link: https://zbi1wtjll8.execute-api.us-east-1.amazonaws.com/v1/joinband
    queryParameters: 
        user_id: value of user_id
        band_id: band id the user wishes to join
    response: 
        "successfully joined band"
    error handling:
        "band id not found"
        "user id not found"


viewBand
    description: retrieves information of the band id
    link: https://zbi1wtjll8.execute-api.us-east-1.amazonaws.com/v1/viewband
    queryParameters: 
        band_id: band id the user wishes to join
    response: 
        type: json 
        example:
            {
                "instructor": "test_instructor",
                "performers": [
                    "test_user1",
                    "test",
                    "test_user"
                ]
            }
    error handling:
        "band id not found"
        "user id not found"


createBand
    description: creates a band 
    link: https://zbi1wtjll8.execute-api.us-east-1.amazonaws.com/v1/createband
    queryParameters: 
        instructor_id: instructor id for creating band
    response: 
        type: json 
        example:
            {
                "band_id": "92913"
            }
    error handling:
        none

