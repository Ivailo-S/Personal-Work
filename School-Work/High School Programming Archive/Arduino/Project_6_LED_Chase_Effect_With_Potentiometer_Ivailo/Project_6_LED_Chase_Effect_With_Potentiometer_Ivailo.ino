// Project 6 - LED Chase Effect Pins w/ Potentiometer
// Create Array for the LED Pins
byte ledPin[] = {4,5,6,7,8,9,10,11,12,13};
int ledDelay(70); // delay inbetween changes
int direction = 1;
int currentLED = 0;
unsigned long changeTime;
int potPin = 2;

void setup() {
  // set all pins to output
  for (int x=0; x<10; x++) {
    pinMode(ledPin[x], OUTPUT); }
    changeTime = millis();
}

void loop() {
//read the value from the pot
ledDelay = analogRead(potPin);
  //if it has been ledDelay ms since last change
  if ((millis() - changeTime) >
ledDelay) {
    changeLED();
    changeTime = millis(); 
  }
}

void changeLED() {
  // turn off all LED's
  for (int x=0; x<10; x++) {
    digitalWrite(ledPin[x], LOW);
  }
  // turn on the current LED
  digitalWrite(ledPin[currentLED], HIGH);
  // increment by the direction value
  currentLED += direction;
  // change the direction if we reach the end
  if (currentLED ==9) {direction = -1;}
  if (currentLED ==0) {direction = 1;}
}
