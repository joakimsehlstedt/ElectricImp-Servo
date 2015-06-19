/*
Joakim Sehlstedt, 17th May 2015.
Electric Imp.
Self-studies assignment, Current Topics in Computer Science, 2DV005.
This is the code for the Device. Transferred to Electric Imp device
when building and deploying the code base.
*/

// Max and min constants for the Futaba FP-S148 servo.
const SERVO_MIN = 0.011
const SERVO_MAX = 0.077
 
// Create global variable for the pin to which the servo is connected
// then configure the pin for PWM
servo <- hardware.pin7
servo.configure(PWM_OUT, 0.03, SERVO_MIN)
 
// A function to control the servo.
// It expects a value between 0.0 and 1.0 to be passed to it
function setServo(value) {
    local scaledValue = value * (SERVO_MAX - SERVO_MIN) + SERVO_MIN
    servo.write(scaledValue)
    server.log("setServo: " + scaledValue)
}
 
// A function to control the servo.
// It expects an angle value between -90.0 and 90.0
function setServoDegrees(value) {
    local scaledValue = (value + 91) / 181.0 * (SERVO_MAX - SERVO_MIN) + SERVO_MIN
    servo.write(scaledValue)
    server.log("setServoDegrees: " + scaledValue)
}

// Swith on the listener for the agent application
agent.on("setServo", setServo)