#define BLYNK_TEMPLATE_ID "TMPLfaQUEeyq"
#define BLYNK_DEVICE_NAME "Quickstart Template"
#define BLYNK_AUTH_TOKEN "fulvyDnrvHAH8M46WA-OrPVDFg4QvRDY"
#define BLYNK_PRINT Serial

#include <Blynk.h>
#include <ESP8266WiFi.h>
#include <BlynkSimpleEsp8266.h>
#include <Adafruit_NeoPixel.h>
#include <EasyNeoPixels.h>


//Motor PINs
#define IN1 D8
#define IN2 D8
#define IN3 D8


int Red = 0;
int Green = 0;
int Blue = 0;


char auth[] = BLYNK_AUTH_TOKEN;
char ssid[] = "DESKTOP-BEHEEYEM"; //Enter your WIFI name
char pass[] = "St0ychev"; //Enter your WIFI password


void setup() {
  //Initialize the serial monitor
  Serial.begin(115200);
  //Set the motor pins as the output pin
  pinMode(IN1, OUTPUT);
  setupEasyNeoPixels(IN1, 12);


  //Initialize the blynk communication
  Blynk.begin(auth, ssid, pass);
}
//Get values from the widgets

BLYNK_WRITE(V1) {
  Red = param.asInt();
}

BLYNK_WRITE(V2) {
  Green = param.asInt();
}

BLYNK_WRITE(V3) {
  Blue = param.asInt();
}

//Check widget values using the IF condition

void loop() {

  //Run the blynk library
  Blynk.run();
  writeEasyNeoPixel(0, Red, Green, Blue);
  writeEasyNeoPixel(1, Red, Green, Blue);
  writeEasyNeoPixel(2, Red, Green, Blue);
  writeEasyNeoPixel(3, Red, Green, Blue);
  writeEasyNeoPixel(4, Red, Green, Blue);
  writeEasyNeoPixel(5, Red, Green, Blue);
  writeEasyNeoPixel(6, Red, Green, Blue);
  writeEasyNeoPixel(7, Red, Green, Blue);
  writeEasyNeoPixel(8, Red, Green, Blue);
  writeEasyNeoPixel(9, Red, Green, Blue);
  writeEasyNeoPixel(10, Red, Green, Blue);
  writeEasyNeoPixel(11, Red, Green, Blue);
  writeEasyNeoPixel(12, Red, Green, Blue);
}
