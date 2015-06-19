/*
Joakim Sehlstedt, 17th May 2015.
Electric Imp.
Self-studies assignment, Current Topics in Computer Science, 2DV005.
This is the code for the Agent running on Electric imp's cloud servers.
*/

// requestHandler is setup to handle the setServo http request
function requestHandler(request, response)  {
    local servoValue
    
    // log the content of the http query to the IDE log
    foreach (key, value in request.query) {
        server.log("Http request: " + key + " = " + value)
    }
    
    try { 
        if ("setServo" in request.query) {
            
            // Cast the setServo value to a float
            try {
                servoValue = request.query.setServo.tofloat()
            } catch (ex) {
                server.log("Cast to float not possible: " + request.query.setServo)
            }
            
            // Sending the servoValue to the device
            device.send("setServo", servoValue)
            server.log("servoValue sending to Device: " + servoValue)
        }
        
        // send a response back saying everything was OK.
        response.send(200, "OK from servo controller")
    } 
    catch (ex) {
        response.send(500, "Internal Server Error: " + ex)
    }
}

// Set up a handler for HTTP requests.
http.onrequest(requestHandler)