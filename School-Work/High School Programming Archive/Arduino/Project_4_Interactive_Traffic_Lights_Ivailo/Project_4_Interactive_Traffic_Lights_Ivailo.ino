// Project 4 - Interactive Traffic Lights

int carRed = 12; // assigning the car light ports
int carYellow = 11;
int carGreen = 10;
int pedRed = 9; // assigning the pedestrian lights
int pedGreen = 8;
int button = 2; // B U T T O N
int crossTime = 5000; // time allowed to cross before you are run over
unsigned long changeTime; // time since button pressed

void setup () { 
  pinMode(carRed, OUTPUT);
  pinMode(carYellow, OUTPUT);
  pinMode(carGreen, OUTPUT);
  pinMode(pedRed, OUTPUT);
  pinMode(pedGreen, OUTPUT);
  pinMode(button, INPUT); // Button on Pin 2
  // Now to turn on the green light so that it can exist
  digitalWrite(carGreen, HIGH);
  digitalWrite(pedRed, HIGH);
}


void loop() {
  int state = digitalRead(button);
  /* check if button is pressed and it is over 5 seconds since last button press */
  if (state == HIGH && (millis() - changeTime) > 5000) {
    // Calls the function to change the lights
    changeLights();
  }
}

void changeLights() {
  digitalWrite(carGreen, LOW); //green off
  digitalWrite(carYellow, HIGH); //yellow on
  delay(2000); //wait 2 seconds
  
  digitalWrite(carYellow, LOW); //yellow off
  digitalWrite(carRed, HIGH); //red on
  delay(1000); //wait one second till it is safe to cross
  
  digitalWrite(pedRed, LOW);
  digitalWrite(pedGreen, HIGH);
  delay(crossTime); //wait for the preset time
  
  //flash the ped green
  for (int x=0; x<10; x++) {
    digitalWrite(pedGreen, HIGH);
    delay(250);
    digitalWrite(pedGreen, LOW);
    delay(250);  
  }
  // turn the ped red on
  digitalWrite(pedRed, HIGH);
  delay(500);
  
  digitalWrite(carYellow, HIGH); //yellow on
  digitalWrite(carRed, LOW); //red off
  delay(1000);
  digitalWrite(carGreen, HIGH);
  digitalWrite(carYellow, LOW); //yellow off
  
  //record the time since last change of lights
  changeTime = millis();
  //then return to the main program loop
}
  
  
