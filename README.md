# Rotating Shining Card

A Flutter widget that displays a 3D rotating card with a shining effect, customizable and interactive.

![Rotating Shining Card](https://github.com/user-attachments/assets/304dc3ec-9a2e-46f6-bc9e-335171498fb1)

## Overview




`RotatingShiningCard` is a customizable Flutter widget that allows you to display a card that can be rotated in 3D space with touch interactions. It includes a shining effect that follows the touch position, adding a dynamic and engaging visual experience.

## Features

- **3D Rotation**: Rotate the card along the X and Y axes based on user touch input.
- **Shining Effect**: A radial shining effect that follows the user's touch, simulating light reflection.
- **Customizable Content**: Use any widget as the front and back faces of the card.
- **Adjustable Properties**: Customize the card's size, border radius, shine intensity, and shine color.
- **Easy Integration**: Simple to add to any Flutter project.

## Installation

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  rotating_shining_card: ^0.1.0
```
Then run:
```
flutter pub get
```
Alternatively, you can install it from the command line:
```
flutter pub add rotating_shining_card
```
## Usage

Import the package in your Dart code:
```
import 'package:rotating_shining_card/rotating_shining_card.dart';
```
Use the RotatingShiningCard widget in your widget tree:
```
RotatingShiningCard(
  width: 200,
  height: 300,
  frontChild: Image.asset('assets/front_image.png', fit: BoxFit.cover),
  backChild: Image.asset('assets/back_image.png', fit: BoxFit.cover),
  borderRadius: 16.0,
  shineIntensity: 0.3,
  shineColor: Colors.white,
),
```
## Example

Here's a basic example of how to use the RotatingShiningCard in a Flutter app:
```
import 'package:flutter/material.dart';
import 'package:rotating_shining_card/rotating_shining_card.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RotatingShiningCard(
          width: 200,
          height: 300,
          frontChild: Image.asset('assets/front_image.png', fit: BoxFit.cover),
          backChild: Image.asset('assets/back_image.png', fit: BoxFit.cover),
          borderRadius: 16.0,
          shineIntensity: 0.3,
          shineColor: Colors.white,
        ),
      ),
    );
  }
}
```
## Customization

* width and height: Set the size of the card.
* frontChild and backChild: Provide any widget to display on the front and back faces.
* borderRadius: Adjust the roundness of the card's corners.
* shineIntensity: Control the opacity of the shine effect (value between 0.0 and 1.0).
* shineColor: Change the color of the shine effect

## Contributions

Contributions are welcome! Please feel free to submit a pull request or open an issue on GitHub.

## Contact
For any questions or suggestions, please contact Hassan Zafar.

