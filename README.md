![Logo](https://github.com/keycube/bbk3/blob/main/assets/Logo_BBK3_White.png)

# INTRODUCTION

The BBK3 (BabyCube) is the miniature derivative of the K3. Thanks to these 5 keys, its gyroscope and accelerator, you can control a multitude of applications thanks to its bluetooh connection.

# 3D Model

The 3D models were made with Fusion 360. The models have been tested with a resin printer but are intended for an FDM printer. (The colors are present to facilitate the 3D preview, you are free to choose when printing.)

![Logo](https://github.com/keycube/bbk3/blob/main/assets/Model_3D_BBK3_1.png)

**Below**

![Logo](https://github.com/keycube/bbk3/blob/main/assets/Model_3D_BBK3_2.png)

**Above**

![Logo](https://github.com/keycube/bbk3/blob/main/assets/Model_3D_BBK3_3.png)

**Support**

![Logo](https://github.com/keycube/bbk3/blob/main/assets/Model_3D_BBK3_4.png)

**Keys**

![Logo](https://github.com/keycube/bbk3/blob/main/assets/Model_3D_BBK3_5.png)

# Electronic components

The components listed below were chosen according to our desires, the dimensions in the 3D models were made accordingly. If you want to choose other electronic components, don't forget to modify the 3D models.


**Microcontroller**: https://www.seeedstudio.com/Seeed-XIAO-BLE-Sense-nRF52840-p-5253.html

**Magnetic connection**: https://www.adafruit.com/product/5413

**Battery**: https://www.adafruit.com/product/1317

**Keys**: https://www.adafruit.com/product/5113

**Keys Sockets**: https://www.adafruit.com/product/5756

**Magnets**: https://www.amazon.fr/Deryun-aimants-puissants-n%C3%A9odyme-r%C3%A9frig%C3%A9rateur/dp/B0936VD5N4/ref=sr_1_1_sspa?keywords=aimant&qid=1697424015&sr=8-1-spons&sp_csd=d2lkZ2V0TmFtZT1zcF9hdGY&psc=1

# TUTORIAL

..._TODO_...

# Code

To code, I used the Arduino IDE. I coded the code "BBK3.ino" as an example.

**- Connection**: The latter creates a Bluetooth connection to be able to connect.

**- Light animation**: The cube flashes red until it is connected and reacts green once it is. When the keys are not pressed, the LEDs are orange and when a key is clicked, the corresponding key is white. After 7 seconds without clicking, the keys turn red and create the animation of a beating heart, returning to normal at the slightest click.

**- Actuators**: The gyroscope is used to move the mouse. The keys simulate the keyboard with Z, Q, S, D and left click on the top key.
