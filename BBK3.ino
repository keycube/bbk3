#include <Adafruit_NeoPixel.h>
#include <BLE52_Mouse_and_Keyboard.h>
#include "LSM6DS3.h"
#include "Wire.h"

// Instantiate the IMU (Inertial Measurement Unit) object
LSM6DS3 myIMU(I2C_MODE, 0x6A);

// Define pin numbers for the LEDs and their corresponding directions
#define LED_PIN 0
#define NORTH 1
#define EAST 2
#define SOUTH 3
#define WEST 4
#define TOP 5

// Define the total number of LEDs
#define LED_COUNT 5

// Instantiate the NeoPixel object for controlling LEDs
Adafruit_NeoPixel pixel(LED_COUNT, LED_PIN, NEO_GRB + NEO_KHZ800);

// Array to store the state of buttons before the current iteration
int stateBefore[] = {0, 0, 0, 0, 0};

// Variable to store the timestamp before sleep
unsigned long tmpBefore1 = 0;

// Flag to indicate whether the device is in sleep mode
bool sleep = 0;

// Function to check if the keyboard is connected and provide visual feedback
void isConnectedMK3() {
  if (!Keyboard.isConnected()) {
    // Blink red lights indicating disconnection
    for (int i = 0; i < LED_COUNT; i++) {
      pixel.setPixelColor(i, pixel.Color(255, 0, 0));
      pixel.show();
      delay(50);
    }
    // Turn off the LEDs
    for (int i = 0; i < LED_COUNT; i++) {
      pixel.setPixelColor(i, pixel.Color(0, 0, 0));
      pixel.show();
      delay(50);
    }
  }

  if (Keyboard.isConnected()) {
    // Blink green lights indicating connection
    for (int i = 0; i < LED_COUNT; i++) {
      pixel.setPixelColor(i, pixel.Color(0, 255, 0));
    }
    pixel.show();
    delay(50);
    // Turn off the LEDs
    for (int i = 0; i < LED_COUNT; i++) {
      pixel.setPixelColor(i, pixel.Color(0, 0, 0));
    }
    pixel.show();
    delay(50);
  }
}

// Function to create a pulsating effect to indicate sleep mode
void isSleep(int pulsationSpeed) {
  static unsigned long dernierChangement = 0;
  static int intensite = 0;
  static bool monte = true;

  unsigned long maintenant = millis();

  if (maintenant - dernierChangement >= pulsationSpeed) {
    dernierChangement = maintenant;
    if (monte) {
      intensite = (intensite + 1) % 256;
      if (intensite == 100) {
        monte = false;
      }
    } else {
      intensite = (intensite - 1 + 256) % 256;
      if (intensite == 0) {
        monte = true;
      }
    }
    // Set the LED colors based on intensity for pulsating effect
    for (int i = 0; i < LED_COUNT; i++) {
      pixel.setPixelColor(i, pixel.Color(intensite, 0, 0));
    }
  }
}

void setup() {
  Serial.begin(115200);

  // Set pin modes for the directional buttons
  pinMode(NORTH, INPUT_PULLUP);
  pinMode(EAST, INPUT_PULLUP);
  pinMode(SOUTH, INPUT_PULLUP);
  pinMode(WEST, INPUT_PULLUP);
  pinMode(TOP, INPUT_PULLUP);

  // Initialize the NeoPixel strip
  pixel.begin();
  pixel.show();
  pixel.setBrightness(255);

  // Initialize the keyboard
  Keyboard.begin();

  // Check if the IMU device is connected
  if (myIMU.begin() != 0) {
    Serial.println("Device error");
  } else {
    Serial.println("Device OK!");
  }
}

void loop() {
  // Move the mouse based on gyroscope readings
  Mouse.move((myIMU.readFloatGyroX() / 2), -(myIMU.readFloatGyroY() / 2));

  // Check and display connection status
  while (!Keyboard.isConnected()) {
    isConnectedMK3();
  }

  // Activate sleep mode after 7 seconds of inactivity
  if (millis() - tmpBefore1 > 7000) {
    sleep = 1;
  }

  if (sleep == 1) {
    // Pulsating effect during sleep
    isSleep(1);
    pixel.show();
    for (int i = 0; i < LED_COUNT; i++) {
      // Check for button press to wake up
      if (digitalRead(i + 1) == 0) {
        tmpBefore1 = millis();
        sleep = 0;
      }
    }
  } else {
    Serial.println(millis() - tmpBefore1);

    // Handle button presses for movement and mouse click
    for (int i = 0; i < LED_COUNT; i++) {
      if (digitalRead(i + 1) == 0) {
        tmpBefore1 = millis();
        pixel.setPixelColor(i, pixel.Color(255, 255, 255));
        pixel.show();
        // Handle button press actions
        if (i == 0) {
          if (stateBefore[i] == 0) {
            Keyboard.press('w');
            stateBefore[i] = 1;
          }
        }
        if (i == 1) {
          if (stateBefore[i] == 0) {
            Keyboard.press('d');
            stateBefore[i] = 1;
          }
        }
        if (i == 2) {
          if (stateBefore[i] == 0) {
            Keyboard.press('s');
            stateBefore[i] = 1;
          }
        }
        if (i == 3) {
          if (stateBefore[i] == 0) {
            Keyboard.press('a');
            stateBefore[i] = 1;
          }
        }
        if (i == 4) {
          if (stateBefore[i] == 0) {
            Mouse.click(MOUSE_LEFT);
            stateBefore[i] = 1;
          }
        }
      } else {
        // Handle button release actions
        pixel.setPixelColor(i, pixel.Color(128, 64, 0));
        pixel.show();
        if (i == 0) {
          if (stateBefore[i] == 1) {
            Keyboard.release('w');
            stateBefore[i] = 0;
          }
        }
        if (i == 1) {
          if (stateBefore[i] == 1) {
            Keyboard.release('d');
            stateBefore[i] = 0;
          }
        }
        if (i == 2) {
          if (stateBefore[i] == 1) {
            Keyboard.release('s');
            stateBefore[i] = 0;
          }
        }
        if (i == 3) {
          if (stateBefore[i] == 1) {
            Keyboard.release('a');
            stateBefore[i] = 0;
          }
        }
        if (i == 4) {
          if (stateBefore[i] == 1) {
            Mouse.release(MOUSE_LEFT);
            stateBefore[i] = 0;
          }
        }
      }
    }
  }
}
