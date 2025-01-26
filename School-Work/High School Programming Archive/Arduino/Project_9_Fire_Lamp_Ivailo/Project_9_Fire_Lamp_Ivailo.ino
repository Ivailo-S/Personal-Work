// Project 9 - LED Fire Effect

int ledPin1 = 5;
int ledPin2 = 6;
int ledPin3 = 9;
int ledPin4 = 10;
int ledPin5 = 11;

void setup()
{
  pinMode(ledPin1, OUTPUT);
  pinMode(ledPin2, OUTPUT);
  pinMode(ledPin3, OUTPUT);
  pinMode(ledPin4, OUTPUT);
  pinMode(ledPin5, OUTPUT);
}

\]'] 4

":?>
000000000 
void loop()
{
  analogWrite(ledPin1, random(120) + 135);
  analogWrite(ledPin2, random(120) + 135);
  analogWrite(ledPin3, random(120) + 135);
  analogWrite(ledPin4, random(120) + 135);
  analogWrite(ledPin5, random(120) + 135);
  delay(random(100));
//}
