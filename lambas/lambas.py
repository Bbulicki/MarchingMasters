import requests

http_urls = {
    "validateCredentials":"https://2fuk84asx0.execute-api.us-east-1.amazonaws.com/default/validateCredentials",
    "retrieveDocument":"https://ar24kqqwub.execute-api.us-east-1.amazonaws.com/default/retrieveDocument",
    "createUser":"https://7h263tyofd.execute-api.us-east-1.amazonaws.com/default/createUser",
    "retrieveFeedback":"https://fuzqjxxgpe.execute-api.us-east-1.amazonaws.com/default/retrieveFeedback",
    "createBand":"https://38zzluuncd.execute-api.us-east-1.amazonaws.com/default/createBand",
    "joinBand":"https://h1z37awbv4.execute-api.us-east-1.amazonaws.com/default/joinBand",
    "viewBand":"https://kj3abgcu45.execute-api.us-east-1.amazonaws.com/default/viewBand",
    "leaveBand":"https://fpj8e63l0i.execute-api.us-east-1.amazonaws.com/default/leaveBand",
    "disbandBand":"https://a3485b2u68.execute-api.us-east-1.amazonaws.com/default/disbandBand",
    "viewPosition":"https://dwu08opp09.execute-api.us-east-1.amazonaws.com/default/viewPosition",
    "loadPosition":"https://7ww2gywg0c.execute-api.us-east-1.amazonaws.com/default/loadPosition",
    "changePassword":"https://4j1sbc9q4j.execute-api.us-east-1.amazonaws.com/default/changePassword"
}

def rest_call(url):
    r = requests.get(url)
    return "status: " + str(r.status_code) + " - " + r.text

def aws():
    for key,val in http_urls.items():
        print(rest_call(val))

aws()