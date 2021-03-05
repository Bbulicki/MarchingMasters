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
	*Note: Do not upload an empty documents otherwise you will get an error"


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
                    "https://mmdrexel.s3.amazonaws.com/documents/test_user/addasdes.csv",
                    "https://mmdrexel.s3.amazonaws.com/documents/test_user/addresses.csv",
                    "https://mmdrexel.s3.amazonaws.com/documents/test_user/addresses1.csv",
                    "https://mmdrexel.s3.amazonaws.com/documents/test_user/test.txt"
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


disbandBand
    description: deletes a band and disassociates band with its corresponding users
    link: https://zbi1wtjll8.execute-api.us-east-1.amazonaws.com/v1/disbandband
    queryParameters:
        band_id: for deleting a band and disassociation
    response:
        "success"
    error handling:
        "band id not found"


leaveBand
    description: leave a band and disassociate user from its corresponding band 
    link: https://fpj8e63l0i.execute-api.us-east-1.amazonaws.com/default/leaveBand 
    queryParameters:
        user_id: for leaving the band and disassociation 
    response:
        "success"
    error handling:
        "user id not found"


sendFeedBack
    description: sends feedback to a given user id 
    link: https://zbi1wtjll8.execute-api.us-east-1.amazonaws.com/v1/sendfeedback
    queryParameters:
        user_id: for sending feedback
        feedback: feedback message for the user
    response:
        "sent"
    error handling:
        none


retrieveFeedBack
    description: returns a list of feedback associated with a given user id 
    link: https://zbi1wtjll8.execute-api.us-east-1.amazonaws.com/v1/retrievefeedback 
    queryParameters:
        user_id: feedback query
    response:
        type: json 
        example:
            {
                "feedback": [
                    "feedback for test_user",
                    "feedback for test_user",
                    "jzhang",
                    "this is new feedback content from postman"
                ]
            }
        *Note the order is last in first out. So, "this is new feedback content from postman" is the most recent feedback.
    error handling:
        none


uploadDrill
    description: uploads a drillsheet into Amazon s3
    link: https://zbi1wtjll8.execute-api.us-east-1.amazonaws.com/v1/uploaddrill 
    queryParameters:
        band_id: for finding the performers associated to the band to upload the drilsheet for 
        filename: name of the file to create correct path 
        response:
            "upload successful"
        error handling:
            "band id not found"


retrieveDrills
    description: retrieves a list of links of s3 bucket drills associated w/ the user
    link: https://zbi1wtjll8.execute-api.us-east-1.amazonaws.com/v1/retrievedrills
    queryParameters: 
        user_id: value of user_id 
    response: 
        type: json
        example: 
            {
                "documents": [
                    "https://mmdrexel.s3.amazonaws.com/drillsheets/test_user/addasdes.csv",
                    "https://mmdrexel.s3.amazonaws.com/drillsheets/test_user/addresses.csv",
                    "https://mmdrexel.s3.amazonaws.com/drillsheets/test_user/addresses1.csv",
                    "https://mmdrexel.s3.amazonaws.com/drillsheets/test_user/test.txt"
                ]
            }
    error handling:
        none





